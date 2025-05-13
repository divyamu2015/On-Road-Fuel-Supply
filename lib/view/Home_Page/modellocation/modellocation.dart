import 'dart:convert';

class LocationUpdateModel {
    final String message;

    LocationUpdateModel({
        required this.message,
    });

    factory LocationUpdateModel.fromRawJson(String str) => LocationUpdateModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LocationUpdateModel.fromJson(Map<String, dynamic> json) => LocationUpdateModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
