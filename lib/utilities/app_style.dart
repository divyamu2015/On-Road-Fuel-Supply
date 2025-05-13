import 'package:flutter/material.dart';
import 'package:fuelapp/utilities/size_config.dart';
import 'package:google_fonts/google_fonts.dart';


String? fontFamily = GoogleFonts.poppins().fontFamily;

class AppTextStyle extends TextStyle {
  AppTextStyle.boldTitleStyle({
    double? fontSize,
    Color? color,
  }) : super(
    inherit: false,
    height: 1.2,
    fontSize: fontSize ?? SizeConfig.textMultiplier * 3.4,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: color ?? const Color.fromARGB(255, 0, 0, 0),
  );
  AppTextStyle.commonTextStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) : super(
    inherit: false,
    height: 1.2,
    fontSize: fontSize ?? SizeConfig.textMultiplier * 2.86,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: fontFamily,
    color: color ?? Colors.black,
  );

  @override
  AppTextStyle.largeText({
    double? fontSize,
    Color? color,
  }) : super(
    inherit: false,
    height: 1.2,
    fontSize: fontSize ?? SizeConfig.textMultiplier * 7.3,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    color: color ?? Colors.black,
  );
  AppTextStyle.largeTitleStyle({
    double? fontSize,
    Color? color,
  }) : super(
    inherit: false,
    height: 1.2,
    fontSize: fontSize ?? SizeConfig.textMultiplier * 4.5,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    color: color ?? Colors.black,
  );
  AppTextStyle.titleTextStyle({
    double? fontSize,
    Color? color,
  }) : super(
    inherit: false,
    height: 1.2,
    fontSize: fontSize ?? SizeConfig.textMultiplier * 3.25,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    color: color ?? Colors.black,
  );
  AppTextStyle.titleTextStyleMedium({
    double? fontSize,
    Color? color,
  }) : super(
    inherit: false,
    height: 1.2,
    fontSize: fontSize ?? SizeConfig.textMultiplier * 3.25,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    color: color ?? Colors.black,
  );
}
