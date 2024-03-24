import 'dart:convert';

/// Created by Neloy on 3/25/2024
/// Email: taufiqneloy.swe@gmail.com

class BaseModel<T> {
  final String? status;
  final String? message;
  final T? data;

  BaseModel({
    this.status,
    this.message,
    this.data,
  });

  factory BaseModel.fromJson(String str) => BaseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BaseModel.fromMap(Map<String, dynamic> json) => BaseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
