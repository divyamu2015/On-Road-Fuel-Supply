import 'dart:convert';

class DeliveryStaetedModel {
  final String message;

  DeliveryStaetedModel({
    required this.message,
  });

  factory DeliveryStaetedModel.fromRawJson(String str) => DeliveryStaetedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeliveryStaetedModel.fromJson(Map<String, dynamic> json) => DeliveryStaetedModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
