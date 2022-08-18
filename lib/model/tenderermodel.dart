// To parse this JSON data, do
//
//     final tenderermodel = tenderermodelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Tenderermodel> tenderermodelFromJson(String str) => List<Tenderermodel>.from(json.decode(str).map((x) => Tenderermodel.fromJson(x)));

String tenderermodelToJson(List<Tenderermodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tenderermodel {
  Tenderermodel({
    required this.id,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory Tenderermodel.fromJson(Map<String, dynamic> json) => Tenderermodel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
