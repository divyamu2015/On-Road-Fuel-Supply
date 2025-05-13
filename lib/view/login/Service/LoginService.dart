import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../constatnts/appurl.dart';
import '../model/Logimodel.dart';



Future<LoginModel> login({required String email , required String password}) async
{
  Map map={"email":email,"pswd":password};
  try {
    final resp = await http.post(
      Uri.parse(Urls.Login),
      body:jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = LoginModel.fromJson(decoded);
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