// To parse this JSON data, do
//
//     final tendersmodel = tendersmodelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Tendersmodel> tendersmodelFromJson(String str) => List<Tendersmodel>.from(json.decode(str).map((x) => Tendersmodel.fromJson(x)));

String tendersmodelToJson(List<Tendersmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tendersmodel {
  Tendersmodel({
    required this.id,
    required this.description,
    required this.address,
    required this.insuranceMoney,
    required this.termsOfRefPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.tenderer,
    required this.phone,
  });

  int id;
  String description;
  String address;
  String insuranceMoney;
  String termsOfRefPrice;
  String? createdAt;
  String? updatedAt;
  String title;
  int tenderer;
  String phone;

  factory Tendersmodel.fromJson(Map<String, dynamic> json) => Tendersmodel(
    id: json["id"],
    description: json["description"],
    address: json["address"],
    insuranceMoney: json["insurance_money"],
    termsOfRefPrice: json["terms_of_ref_price"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    title: json["title"],
    tenderer: json["tenderer"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "address": address.toString(),
    "insurance_money": insuranceMoney,
    "terms_of_ref_price": termsOfRefPrice,
    "created_at": createdAt.toString(),
    "updated_at": updatedAt.toString(),
    "title": title,
    "tenderer": tenderer,
    "phone": phone,
  };
}
