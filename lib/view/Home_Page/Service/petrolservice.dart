import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../constatnts/appurl.dart';
import '../model/petrolmodel.dart';

Future<PetrolModel> getPetrolRepo() async {
  try {
    final resp = await http.get(
      Uri.parse(Urls.FuelPrice),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    ).timeout(const Duration(seconds: 20));
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = PetrolModel.fromJson(decoded);
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
   }  on TimeoutException{
    throw Exception('Timeout');
  } catch (e) {
    throw Exception(e.toString());
  }
}
