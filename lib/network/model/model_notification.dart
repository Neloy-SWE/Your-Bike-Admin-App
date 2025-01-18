import 'dart:convert';

class NotificationModel {
  final int? id;
  final bool? read;
  final String? brand;
  final String? model;

  NotificationModel({
    this.id,
    this.read,
    this.brand,
    this.model,
  });

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        read: json["read"],
        brand: json["brand"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "read": read,
        "brand": brand,
        "model": model,
      };
}
