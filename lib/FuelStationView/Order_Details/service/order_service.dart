import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../constatnts/appurl.dart';
import '../model/deliverystartedmodel.dart';

Future<DeliveryStaetedModel> DeliveryStartedRepo({required String id ,required String staus}) async
{
  Map map={"id":id,"dlvry_status":staus};
  try {
    final resp = await http.post(
      Uri.parse(Urls.OederStarted),
      body:jsonEncode(map),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = DeliveryStaetedModel.fromJson(decoded);
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