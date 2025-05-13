import 'dart:convert';
import 'dart:io';
import 'package:fuelapp/FuelStationView/Location_View%20fS/model/locationmodel.dart';
import 'package:http/http.dart' as http;

import '../../../constatnts/appurl.dart';

Future<LoginFsModel> locationrepoFs(
    {required int id, required String LongLat}) async {
  Map map = {"id": id.toString(), "fuel_loc": LongLat};
  try {
    final resp = await http.post(
      Uri.parse(Urls.LocationFs),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = LoginFsModel.fromJson(decoded);
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
