import 'dart:convert';

class OrderListModel {
    final List<Datum> data;

    OrderListModel({
        required this.data,
    });

    factory OrderListModel.fromRawJson(String str) => OrderListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
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
    final String dlvryStatus;
    final int fuelsId;
    final int usersId;

    Datum({
        required this.id,
        required this.ltr,
        required this.type,
        required this.date,
        required this.time,
        required this.price,
        required this.dlvryStatus,
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
        dlvryStatus: json["dlvry_status"],
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
        "dlvry_status": dlvryStatus,
        "fuels_id": fuelsId,
        "users_id": usersId,
    };
}
