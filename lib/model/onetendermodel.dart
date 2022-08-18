// To parse this JSON data, do
//
//     final onetendermodel = onetendermodelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Onetendermodel> onetendermodelFromJson(String str) => List<Onetendermodel>.from(json.decode(str).map((x) => Onetendermodel.fromJson(x)));

String onetendermodelToJson(List<Onetendermodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Onetendermodel {
  Onetendermodel({
    required this.id,
    required this.title,
    required this.description,
    required this.pdfTender,
    required this.createdAt,
    required this.updatedAt,
    required this.phone,
    required this.address,
    required this.insuranceMoney,
    required this.termsOfRefPrice,
    required this.tenderer,
  });

  int id;
  String title;
  String description;
  String pdfTender;
  DateTime createdAt;
  DateTime updatedAt;
  String phone;
  String address;
  String insuranceMoney;
  String termsOfRefPrice;
  int tenderer;

  factory Onetendermodel.fromJson(Map<String, dynamic> json) => Onetendermodel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    pdfTender: json["pdf_tender"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    phone: json["phone"],
    address: json["address"],
    insuranceMoney: json["insurance_money"],
    termsOfRefPrice: json["terms_of_ref_price"],
    tenderer: json["tenderer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "pdf_tender": pdfTender,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "phone": phone,
    "address": address,
    "insurance_money": insuranceMoney,
    "terms_of_ref_price": termsOfRefPrice,
    "tenderer": tenderer,
  };
}
