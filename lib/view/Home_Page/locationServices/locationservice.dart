// import 'dart:convert';
// import 'dart:io';
// import 'package:fuelapp/Hive_Model/location/location_hive.dart';
// import 'package:fuelapp/constatnts/appurl.dart';
// import 'package:fuelapp/view/Home_Page/modellocation/modellocation.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// Future<LocationUpdateModel> locationservice( LocationDataModel locationDataModel
 
// ) async {
//   try {
//     var requestBody = <String, dynamic>{};
//     requestBody['smandocno'] = "stf-1003";
//     requestBody['date'] = DateFormat('yyyy-MM-dd').format(DateTime.now());
//     requestBody['latitude']=locationDataModel.latitude.toString();
//     requestBody['longitude']=locationDataModel.longitude.toString();
//     final resp = await http.post(
//       Uri.parse(Urls.locationtracking),
//       body:  requestBody,
//       headers: <String, String>{
//         'Content-Type': 'application/x-www-form-urlencoded',
//       },
//     );
//     final Map<String, dynamic> decoded = jsonDecode(resp.body);
//     if (resp.statusCode == 200) {
//       final response = LocationUpdateModel.fromJson(decoded);
//       return response;
//     } else {
//       throw Exception('Failed to load response');
//     }
//   } on SocketException {
//     throw Exception('Server error');
//   } on HttpException {
//     throw Exception('Something went wrong');
//   } on FormatException {
//     throw Exception('Bad request');
//   } catch (e) {
//     throw Exception(e.toString());
//   }
// }