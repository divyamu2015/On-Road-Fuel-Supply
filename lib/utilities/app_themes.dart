import 'package:flutter/material.dart';
import 'package:fuelapp/utilities/size_config.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  ThemeData getAppThemeLight() {
    return ThemeData(
      useMaterial3: false,
        primaryColor: Colors.white,
        //primarySwatch: Colors.white,
        fontFamily: GoogleFonts
            .poppins()
            .fontFamily,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                textStyle: WidgetStatePropertyAll(
                  TextStyle(
                      fontSize: SizeConfig.textMultiplier * 2,
                      color: Colors.white
                    //make mt all elevated button color indigoaccent
                  ),
                ))),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.blue,
            ),
            actionsIconTheme: const IconThemeData(color: Colors.white),
            centerTitle: false,
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: SizeConfig.textMultiplier * 5)));
  }

  ThemeData getAppThemeDark() {
    return ThemeData(
        primaryColor: Colors.blue,
        fontFamily: GoogleFonts
            .poppins()
            .fontFamily,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: WidgetStateProperty.all(TextStyle(
                  fontSize: SizeConfig.textMultiplier * 3.5,
                  color: Colors.white)),
              // Makes all my ElevatedButton green
              backgroundColor: WidgetStateProperty.all<Color>(
                Colors.blue,
              ),
            )),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.blue),
            actionsIconTheme: const IconThemeData(color: Colors.white),
            centerTitle: false,
            elevation: 10,
            titleTextStyle: TextStyle(
                color: Colors.black54,
                fontSize: SizeConfig.textMultiplier * 5)),
        colorScheme:
        ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.white)
            .copyWith(surface: Colors.blue));
  }
}
