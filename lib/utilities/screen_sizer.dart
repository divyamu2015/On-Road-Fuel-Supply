import 'package:flutter/material.dart';
import 'package:fuelapp/utilities/size_config.dart';




class ScreenSetter extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  const ScreenSetter({
    super.key,
    required this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? SizeConfig.screenheight,
      width: width ?? SizeConfig.screenwidth,
      child: child,
    );
  }
}
