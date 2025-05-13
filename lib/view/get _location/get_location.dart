// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:fuelapp/Hive_Model/location/location_hive.dart';
// import 'package:fuelapp/view/Home_Page/locationServices/locationservice.dart';
// import 'package:location/location.dart';
// import '../../Hive_Model/location/locattionfunctions.dart';
// import 'package:flutter/material.dart';

// class Locationdata1 {
//   static bool stopLocationUpdates = false;
//  static  StreamSubscription<LocationData?>?localSubscription;
//   static Location location = Location();
//   static Future<void> stopLocationUpdate() async {
//     stopLocationUpdates = true;
//     location.enableBackgroundMode(enable: false);
//   }

//   static Future<LocationData?> getLocationdata() async {
//     stopLocationUpdates = false;
//     LocationData? currentLocation;
//     location.changeNotificationOptions(color: Colors.red,title: "Location Started");
//     location.enableBackgroundMode(enable: true);
//     location.changeSettings(accuracy: LocationAccuracy.high, interval:  30000);
//     localSubscription=location.onLocationChanged.listen((
//       LocationData newLocation,
//     ) async {
//       if (kDebugMode) {
//         print(newLocation);
//       }
//       if(stopLocationUpdates)
//         {
//           try{
//             localSubscription?.cancel();
//             localSubscription=null;
//           }
//           catch(e) {
//             if (kDebugMode) {
//               print('Error while canceling subscription: $e');
//             }
//           }
//           return;
//         }
//       currentLocation = newLocation;
//       LocationDataService location = LocationDataService();
//       LocationDataModel locationData = LocationDataModel(
//         latitude: newLocation.latitude ??
//             0.0, 
//         longitude: newLocation.longitude ??
//             0.0, 
//       );
      
//       location.saveLocationData(locationData);
//        final response =await locationservice(latitude: newLocation.latitude.toString(), longitude: newLocation.longitude.toString());
//        if(response.message=="success")
//        {
//          if (kDebugMode) {
//          print("datasent");
//          print("${DateTime.now()}");
//        }
//        }
//     });
//     return currentLocation;
//   }
// }
