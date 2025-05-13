// import 'dart:async';
//
// import 'package:cron/cron.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class Locationdata1
// {
//
//   static Future<LocationData?> getLocationdata()async
//   {
//     LatLng? currentposition;
//     LocationData? currentLocation;
//     Location location =  Location();
//     location.enableBackgroundMode(enable: true);
//     location.changeSettings(
//         accuracy: LocationAccuracy.high,
//         interval: 1000
//     );
//     final completer = Completer<LocationData>();
//     StreamSubscription<LocationData> locationSubscription;
//     locationSubscription= location.onLocationChanged.listen((LocationData newLocation,) {
//       print(newLocation);
//       currentLocation=newLocation;
//       // completer.complete(newLocation);
//     });
//     return currentLocation;
//   }
// }