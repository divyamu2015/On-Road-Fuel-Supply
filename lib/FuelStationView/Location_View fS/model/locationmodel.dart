import 'dart:convert';

class LoginFsModel {
    final String status;
    final Data data;

    LoginFsModel({
        required this.status,
        required this.data,
    });

    factory LoginFsModel.fromRawJson(String str) => LoginFsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginFsModel.fromJson(Map<String, dynamic> json) => LoginFsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    final String fuelLoc;

    Data({
        required this.fuelLoc,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        fuelLoc: json["fuel_loc"],
    );

    Map<String, dynamic> toJson() => {
        "fuel_loc": fuelLoc,
    };
}
