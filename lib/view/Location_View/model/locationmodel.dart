
import 'dart:convert';

class LocationModel {
    final String status;
    final Data data;

    LocationModel({
        required this.status,
        required this.data,
    });

    factory LocationModel.fromRawJson(String str) => LocationModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    final String usrLoc;

    Data({
        required this.usrLoc,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        usrLoc: json["usr_loc"],
    );

    Map<String, dynamic> toJson() => {
        "usr_loc": usrLoc,
    };
}
