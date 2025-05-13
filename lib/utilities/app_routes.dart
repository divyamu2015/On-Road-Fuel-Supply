import 'package:flutter/material.dart';
import 'package:fuelapp/view/Location_Page/pages/Locationpage.dart';

import '../FuelStationView/HomeFuelMain_Page/homeFuel MainPage.dart';
import '../view/MainHome_Page/home_page.dart';
import '../view/fuelstationlogin/Page/fuelstationlogin.dart';
import '../view/fuelstationsignup/Pages/fuelstationsignup.dart';
import '../view/login/Pages/login_page.dart';
import '../view/signup/Pages/signup_page.dart';

final GlobalKey<ScaffoldMessengerState> navigatorKey = GlobalKey<ScaffoldMessengerState>();

class RouteEngine {
  static Object? args;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    args = settings.arguments;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          settings: const RouteSettings(name: "/login"),
          maintainState: true,
          builder: (_) =>  const LoginScreen(),
        );
      case '/signupimage':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/Signupimage'),
          maintainState: true,
          builder: (_) => const SignUp_Screen(),
        );
      case '/fuellogin':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/fuellogin'),
          maintainState: true,
          builder: (_) => const FuelStationLogin(),
        );
      case '/fuelsignup':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/fuelsignup'),
          maintainState: true,
          builder: (_) => const SignUpScreenFuel(),
        );
      case '/mainhomePage':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/mainhomePage'),
          maintainState: true,
          builder: (_) => const MainHomePage(),
        );
      case '/mainfuelhomePage':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/mainfuelhomePage'),
          maintainState: true,
          builder: (_) => const MainFuelHomePage(),
        );
        case '/locationuserPage':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/locationuserPage'),
          maintainState: true,
          builder: (_) => const LocationPage(),
        );
    }
    return null;
  }
}
