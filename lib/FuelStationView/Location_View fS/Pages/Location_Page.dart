import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuelapp/utilities/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../widgets/ModelshetLocation.dart';

class LocationViewFs extends StatefulWidget {
  const LocationViewFs({super.key});

  @override
  State<LocationViewFs> createState() => _LocationViewFsState();
}

class _LocationViewFsState extends State<LocationViewFs> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng? currentposition;
  LatLng initalPosition = const LatLng(9.7975, 76.7658);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: SizeConfig.screenheight * .7,
              width: SizeConfig.screenwidth,
              child: GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: false,
                  zoomGesturesEnabled: true,
                  buildingsEnabled: true,
                  compassEnabled: true,
                  indoorViewEnabled: false,
                  mapToolbarEnabled: true,
                  minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  trafficEnabled: false,
                  cameraTargetBounds: CameraTargetBounds.unbounded,
                  onCameraMove: (CameraPosition newPosition) {
                    // print(newPosition.target.toJson());
                    currentposition = newPosition.target;
                  },
                  onTap: (argument) {
                    setState(() {
                      currentposition = argument;
                    });
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: <Marker>{
                    _setMarker(),
                  },
                  // onMapCreated: _onMapCreated,

                  initialCameraPosition:
                      CameraPosition(zoom: 14.4746, target: initalPosition)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  " Location",
                  style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(234, 83, 82, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(
                  thickness: 1,
                ),
                Text(
                  "${currentposition?.longitude.toString()},${currentposition?.latitude.toString()}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return ModelSheetLocationFs(
                          finalposition: currentposition!,
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(234, 83, 82, 1)),
                  child: const Text(
                    "Confirm Location",
                    style: TextStyle(color: Colors.white, fontSize: 27),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _setMarker() {
    return Marker(
        markerId: const MarkerId("Marker 1"),
        icon: BitmapDescriptor.defaultMarkerWithHue(10),
        position: currentposition ?? initalPosition);
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    LatLng? latLng = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
    setState(() {
      currentposition = latLng;
      _goToTheLake();
    });
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: currentposition ?? initalPosition,
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
  }
}
