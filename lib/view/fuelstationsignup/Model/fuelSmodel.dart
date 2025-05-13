
import 'dart:convert';

class FuelSModel {
  final String status;

  FuelSModel({
    required this.status,
  });

  factory FuelSModel.fromRawJson(String str) => FuelSModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FuelSModel.fromJson(Map<String, dynamic> json) => FuelSModel(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
