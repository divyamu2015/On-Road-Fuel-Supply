import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../constatnts/appurl.dart';
import '../model/locationsdetailmodel.dart';

Future<LocationDetailsModel> locationDetailsrepo(
    {required int id, }) async {
  Map map = {"usr_id": id.toString(),};
  try {
    final resp = await http.post(
      Uri.parse(Urls.LocationDetails),
      body: jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = LocationDetailsModel.fromJson(decoded);
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

