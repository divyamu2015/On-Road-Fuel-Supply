import 'dart:convert';
import 'dart:io';
import 'package:fuelapp/view/Location_View/model/locationmodel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../../constatnts/appurl.dart';
Box? box1;
void openBox() async {
  box1 = await Hive.openBox("logindata");
}
Future<LocationModel> locationrepo(
    {required int id,required String longLat}) async {
  Map map = {"id": id.toString(), "usr_loc": longLat};
  try {
    final resp = await http.post(
      Uri.parse(Urls.Location),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = LocationModel.fromJson(decoded);
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
