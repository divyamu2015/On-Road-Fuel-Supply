
import 'dart:convert';

class LocationDetailsModel {
    final List<FuelLocation> fuelLocations;

    LocationDetailsModel({
        required this.fuelLocations,
    });

    factory LocationDetailsModel.fromRawJson(String str) => LocationDetailsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LocationDetailsModel.fromJson(Map<String, dynamic> json) => LocationDetailsModel(
        fuelLocations: List<FuelLocation>.from(json["fuel_locations"].map((x) => FuelLocation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fuel_locations": List<dynamic>.from(fuelLocations.map((x) => x.toJson())),
    };
}

class FuelLocation {
    final int id;
    final String name;
    final String phone;
    final double distanceKm;

    FuelLocation({
        required this.id,
        required this.name,
        required this.phone,
        required this.distanceKm,
    });

    factory FuelLocation.fromRawJson(String str) => FuelLocation.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FuelLocation.fromJson(Map<String, dynamic> json) => FuelLocation(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        distanceKm: json["distance_km"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "distance_km": distanceKm,
    };
}
