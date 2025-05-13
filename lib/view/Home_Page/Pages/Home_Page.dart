import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
//import 'package:location/location.dart';

import '../../../constatnts/app_images.dart';
import '../../../utilities/size_config.dart';
//import '../../get _location/get_location.dart';
import '../Service/petrolservice.dart';
import '../widgets/modelsheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> pictures = [
  Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.fuelposter1), fit: BoxFit.fill)),
  ),
  Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.fuelposter2), fit: BoxFit.fill)),
  ),
];

class _HomePageState extends State<HomePage> {
  Box? box1;

  @override
  void initState() {
    // TODO: implement initState
    openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.screenwidth * .07,
              top: SizeConfig.screenheight * .05),
          child: Text(
            "Hello ${box1?.get('username')}",
            style: GoogleFonts.poppins(
                color: const Color.fromRGBO(82, 85, 84, 1),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenheight * .01,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.screenwidth * .07),
          child: Text(
            "Welcome",
            style: GoogleFonts.poppins(
                color: const Color.fromRGBO(234, 83, 82, 1),
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenheight * .05,
        ),
        CarouselSlider(
            items: pictures,
            options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlay: true,
              enlargeCenterPage: true,
              height: 200,
              autoPlayCurve: Curves.elasticInOut,
              aspectRatio: 16 / 9,
            )),
        SizedBox(
          height: SizeConfig.screenheight * .1,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.screenwidth * .07),
          child: Text(
            "Select Product",
            style: GoogleFonts.poppins(
                color: const Color.fromRGBO(82, 85, 84, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: SizeConfig.screenheight * .05,
        ),
        Center(
          child: FutureBuilder(
            future: getPetrolRepo(),
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
                } else if (snapshot.data!.data.isNotEmpty) {
                  return Center(
                    child: Container(
                      width: SizeConfig.screenwidth * .4,
                      height: SizeConfig.screenheight * .3,
                      color: Colors.white,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.local_gas_station,
                            color: Color.fromRGBO(234, 83, 82, 1),
                            size: 40,
                          ),
                          SizedBox(
                            height: SizeConfig.screenheight * .02,
                          ),
                          Text(
                            "Diesel=${snapshot.data?.data.first.dieselprice}",
                            style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(82, 85, 84, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.screenheight * .02,
                          ),
                          Text(
                            "Petrol=${snapshot.data?.data.first.petrolprice}",
                            style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(82, 85, 84, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.screenheight * .02,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                context: context,
                                builder: (context) {
                                  return ModelSheet1(DieselPrice: snapshot.data!.data.first.dieselprice, PetrolPrice: snapshot.data!.data.first.petrolprice,);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(234, 83, 82, 1)),
                            child: const Text(
                              "Buy",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
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
                child: Text("Server Error,Try Afrer SomeTime",style: TextStyle(
                  fontSize: 15
                ),),
              );
            },
          ),
        ),
        SizedBox(
          height: SizeConfig.screenheight * .1,
        ),
      ],
    );
  }

  void openBox() async {
    box1 = await Hive.openBox("logindata");
    setState(() {});
  }
}
