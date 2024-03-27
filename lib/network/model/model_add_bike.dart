import 'dart:convert';

/// Created by Neloy on 3/26/2024
/// Email: taufiqneloy.swe@gmail.com

class AddBikeModel {
  final String? name;
  final String? image;
  final String? brandName;
  final double? cc;
  final int? gears;
  final String? maxPower;
  final String? maxTorque;
  final String? mileage;
  final double? fuelTankCapacity;
  final double? engineOilCapacity;
  final double? seatHeight;
  final String? frontSuspension;
  final String? rearSuspension;
  final String? frontBreak;
  final String? rearBreak;
  final String? frontWheel;
  final String? rearWheel;
  final String? frontTyre;
  final String? rearTyre;

  AddBikeModel({
    this.name,
    this.image,
    this.brandName,
    this.cc,
    this.gears,
    this.maxPower,
    this.maxTorque,
    this.mileage,
    this.fuelTankCapacity,
    this.engineOilCapacity,
    this.seatHeight,
    this.frontSuspension,
    this.rearSuspension,
    this.frontBreak,
    this.rearBreak,
    this.frontWheel,
    this.rearWheel,
    this.frontTyre,
    this.rearTyre,
  });

  factory AddBikeModel.fromJson(String str) =>
      AddBikeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddBikeModel.fromMap(Map<String, dynamic> json) => AddBikeModel(
        name: json["name"],
        image: json["image"],
        brandName: json["brandName"],
        cc: json["cc"]?.toDouble(),
        gears: json["gears"],
        maxPower: json["maxPower"],
        maxTorque: json["maxTorque"],
        mileage: json["mileage"],
        fuelTankCapacity: json["fuelTankCapacity"]?.toDouble(),
        engineOilCapacity: json["engineOilCapacity"]?.toDouble(),
        seatHeight: json["seatHeight"]?.toDouble(),
        frontSuspension: json["frontSuspension"],
        rearSuspension: json["rearSuspension"],
        frontBreak: json["frontBreak"],
        rearBreak: json["rearBreak"],
        frontWheel: json["frontWheel"],
        rearWheel: json["rearWheel"],
        frontTyre: json["frontTyre"],
        rearTyre: json["rearTyre"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "brandName": brandName,
        "cc": cc,
        "gears": gears,
        "maxPower": maxPower,
        "maxTorque": maxTorque,
        "mileage": mileage,
        "fuelTankCapacity": fuelTankCapacity,
        "engineOilCapacity": engineOilCapacity,
        "seatHeight": seatHeight,
        "frontSuspension": frontSuspension,
        "rearSuspension": rearSuspension,
        "frontBreak": frontBreak,
        "rearBreak": rearBreak,
        "frontWheel": frontWheel,
        "rearWheel": rearWheel,
        "frontTyre": frontTyre,
        "rearTyre": rearTyre,
      };
}
