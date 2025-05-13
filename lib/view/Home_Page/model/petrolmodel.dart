
import 'dart:convert';

class PetrolModel {
  final List<Datum> data;

  PetrolModel({
    required this.data,
  });

  factory PetrolModel.fromRawJson(String str) => PetrolModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PetrolModel.fromJson(Map<String, dynamic> json) => PetrolModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final String dieselprice;
  final String petrolprice;

  Datum({
    required this.id,
    required this.dieselprice,
    required this.petrolprice,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    dieselprice: json["dieselprice"],
    petrolprice: json["petrolprice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dieselprice": dieselprice,
    "petrolprice": petrolprice,
  };
}
