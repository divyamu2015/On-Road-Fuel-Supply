import 'dart:convert';

class RegisterModel {
  final String status;

  RegisterModel({
    required this.status,
  });

  factory RegisterModel.fromRawJson(String str) => RegisterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
