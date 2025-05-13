import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuelapp/utilities/app_navigator.dart';
import 'package:fuelapp/utilities/app_routes.dart';
import 'package:fuelapp/utilities/app_themes.dart';
import 'package:fuelapp/utilities/size_config.dart';  
import 'package:fuelapp/view/Splash_Screen/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'Hive_Model/location/location_hive.dart';


void main()async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(LocationDataModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF000000),
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Color.fromARGB(255, 255, 255, 255)));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ],);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints,orientation);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Fuel App",
            theme: AppTheme().getAppThemeLight(),
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: RouteEngine.generateRoute,
            scaffoldMessengerKey: scaffoldMsgKey,
            // initialRoute: ,
            home: SplashScreen()
        );
      },);
    },);
  }
}
