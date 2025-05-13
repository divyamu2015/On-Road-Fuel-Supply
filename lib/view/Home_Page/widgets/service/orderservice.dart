import 'dart:convert';
import 'dart:io';
import 'package:fuelapp/constatnts/appurl.dart';
import 'package:fuelapp/view/Home_Page/widgets/model/ordermodel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<OrderModel> orderdetail(
    {required String quantity,
    required String date,
    required String time,
    required String location,
    required String price,
    required String type}) async {
  Box? box1;
  box1 = await Hive.openBox('logindata');
  Map map = {
    "ltr": quantity,
    "date": date,
    "time": time,
    "fuels_id": location,
    "price": price,
    "type": type,
    "users_id":box1.get('id')
  };
  try {
    final resp = await http.post(
      Uri.parse(Urls.OrderProduct),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = OrderModel.fromJson(decoded);
      return response;
    } else {
      throw Exception('Failed to load response');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
