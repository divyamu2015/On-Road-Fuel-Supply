
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../constatnts/appurl.dart';
import '../Model/fuelSmodel.dart';


Future<FuelSModel> getFuelSlist({required String name,required String phonenumber,required String email,required String username,required String password,required String location}) async {
  try {
    Map param = {
      "name":name,
      "phn":phonenumber,
      "email":email,
      "uname":username,
      "pswd": password,
      "loc":location
    };
    final resp = await http.post(
      Uri.parse(Urls.FuelSRegister),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = FuelSModel.fromJson(decoded);
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
