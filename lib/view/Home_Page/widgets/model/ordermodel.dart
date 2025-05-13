import 'dart:convert';

class OrderModel {
    final String status;
    final List<Datum> data;

    OrderModel({
        required this.status,
        required this.data,
    });

    factory OrderModel.fromRawJson(String str) => OrderModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final int id;
    final String ltr;
    final String type;
    final String date;
    final String time;
    final String price;
    final dynamic fuelsId;
    final dynamic usersId;

    Datum({
        required this.id,
        required this.ltr,
        required this.type,
        required this.date,
        required this.time,
        required this.price,
        required this.fuelsId,
        required this.usersId,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        ltr: json["ltr"],
        type: json["type"],
        date: json["date"],
        time: json["time"],
        price: json["price"],
        fuelsId: json["fuels_id"],
        usersId: json["users_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ltr": ltr,
        "type": type,
        "date": date,
        "time": time,
        "price": price,
        "fuels_id": fuelsId,
        "users_id": usersId,
    };
}
