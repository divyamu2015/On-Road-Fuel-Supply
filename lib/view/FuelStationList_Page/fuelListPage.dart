import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fuelapp/utilities/screen_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../utilities/size_config.dart';
import '../Home_Page/Service/locationdetailsservice.dart';

class FuelStationListPage extends StatefulWidget {
  const FuelStationListPage({super.key, required this.locationidinner});
  final TextEditingController locationidinner;
  @override
  State<FuelStationListPage> createState() => _FuelStationListPageState();
}

class _FuelStationListPageState extends State<FuelStationListPage> {
  final size = SizedBox(
    height: SizeConfig.screenheight * .04,
  );

  final widthh = SizedBox(
    width: SizeConfig.screenwidth * .05,
  );
  Box? box1;
  @override
  void initState() {
    // TODO: implement initState
    openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(234, 242, 255, 1),
            body: ScreenSetter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenwidth * .07,
                        top: SizeConfig.screenheight * .04),
                    child: Text(
                      "Delivery Locations",
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(234, 83, 82, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                  FutureBuilder(
                    future: locationDetailsrepo(id: box1?.get('id') ?? 0),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          const Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 25,
                            ),
                          );
                          print("ID from box: ${box1?.get('id')}");

                        } else if (snapshot.data!.fuelLocations.isNotEmpty) {
                          return Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: SizeConfig.screenwidth * .8,
                                    height: SizeConfig.screenheight * .25,
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.local_gas_station,
                                                color: Color.fromRGBO(
                                                    234, 83, 82, 1),
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.data!
                                                    .fuelLocations[index].name,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                          const Divider(
                                            thickness: 1,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.bike_scooter,
                                                color: Color.fromRGBO(
                                                    234, 83, 82, 1),
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot
                                                    .data!
                                                    .fuelLocations[index]
                                                    .distanceKm
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.phone,
                                                color: Color.fromRGBO(
                                                    234, 83, 82, 1),
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.data!
                                                    .fuelLocations[index].phone,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          ElevatedButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                Color.fromRGBO(234, 83, 82, 1),
                                              )),
                                              onPressed: () {
                                                setState(() {
                                                  widget.locationidinner.text =
                                                      snapshot
                                                          .data!
                                                          .fuelLocations[index]
                                                          .id
                                                          .toString();
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Select Fuel Station",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: snapshot.data!.fuelLocations.length),
                          );
                        }
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SpinKitRotatingCircle(
                            color: Colors.red,
                            size: 50.0,
                          ),
                        );
                      }
                      return const Center(
                        child: Text(
                          "Server Error,Try Afrer SomeTime",
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )));
  }

  void openBox() async {
    box1 = await Hive.openBox("logindata");
    setState(() {});
  }
}
