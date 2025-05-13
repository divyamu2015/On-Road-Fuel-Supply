
import 'dart:convert';

class LoginModel {
    final List<Datum> data;

    LoginModel({
        required this.data,
    });

    factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final String status;
    final String message;
    final int id;
    final String username;
    final String email;
    final String phone;
    final String name;

    Datum({
        required this.status,
        required this.message,
        required this.id,
        required this.username,
        required this.email,
        required this.phone,
        required this.name,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["status"],
        message: json["message"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "name": name,
    };
}

