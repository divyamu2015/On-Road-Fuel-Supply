
import 'dart:convert';

class LoginFsModel {
    final List<Datum> data;

    LoginFsModel({
        required this.data,
    });

    factory LoginFsModel.fromRawJson(String str) => LoginFsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginFsModel.fromJson(Map<String, dynamic> json) => LoginFsModel(
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
    final String name;
    final String phone;

    Datum({
        required this.status,
        required this.message,
        required this.id,
        required this.username,
        required this.email,
        required this.name,
        required this.phone,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["status"],
        message: json["message"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": id,
        "username": username,
        "email": email,
        "name": name,
        "phone": phone,
    };
}
