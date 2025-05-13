import 'dart:convert';
import 'dart:io';
import 'package:fuelapp/view/Orders_Page/Models/myordermodel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../constatnts/appurl.dart';




Future<GetUserOrderModel> getUserorderRepo() async
{
  Box? box1;
  box1 = await Hive.openBox('logindata');
  Map map={"users_id":box1.get('id'),};
  try {
    final resp = await http.post(
      Uri.parse(Urls.UserProduct),
      body:jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = GetUserOrderModel.fromJson(decoded);
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