import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../../../utilities/size_config.dart';
import '../../FuelStationView/HomeFuelMain_Page/homeFuel MainPage.dart';
import '../../utilities/screen_sizer.dart';
import '../MainHome_Page/home_page.dart';
import '../intro_slider/intro_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;
  late Box box1;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }


  _loadWidget() async {
    var duration = Duration(seconds: splashDelay);
    return Timer(duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    box1= await Hive.openBox("logindata");
    bool introSeen = box1.get("isLogged",defaultValue: false);
    bool user =box1.get("userlogin",defaultValue: false);
    Navigator.pop(context);
    if (introSeen) {
      if(user)
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainHomePage(),));
      }
      else
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainFuelHomePage(),));
      }

    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IntroScreen(),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:    ScreenSetter(
        child: Container(
          width: SizeConfig.screenwidth,
          height: SizeConfig.screenheight ,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 113, 33, 1),
              Color.fromRGBO(234, 83, 82, 1),
            ], begin: Alignment.bottomRight, end: Alignment.centerLeft),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                Icon(
                  Icons.local_gas_station,
                  color: Colors.white,
                  size: SizeConfig.sizeMultiplier * 40,
                ),
                Text(
                  "Fuel Delivery app ",
                  style: GoogleFonts.oswald(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: SizeConfig.textMultiplier * 5),
                ),
                Text(
                  "Fueling Your Journey, Your Way",
                  style: GoogleFonts.oswald(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: SizeConfig.textMultiplier * 3),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}