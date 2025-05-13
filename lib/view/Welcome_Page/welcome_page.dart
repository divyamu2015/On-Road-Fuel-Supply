import 'package:flutter/material.dart';

import '../../utilities/app_style.dart';
import '../../utilities/screen_sizer.dart';
import '../../utilities/size_config.dart';


class WelocomePage extends StatelessWidget {
  const WelocomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:ScreenSetter(
        child: Scaffold(
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier*6.5,
                  ),
                  Text(
                    "Hello There",
                    style: AppTextStyle.boldTitleStyle(
                      fontSize:SizeConfig.textMultiplier*10 ,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier*3,
                  ),
                  Text("Choose Your Account Type",  style: AppTextStyle.boldTitleStyle(
                    fontSize:SizeConfig.textMultiplier*7 ,
                  ),),
                  SizedBox(
                    height: SizeConfig.heightMultiplier*3.5,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: SizeConfig.screenheight * .3,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(236, 113, 33, 1),
                        Color.fromRGBO(234, 83, 82, 1),
                      ], begin: Alignment.bottomRight, end: Alignment.centerLeft),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.local_gas_station,
                        color: Colors.white,
                        size: SizeConfig.sizeMultiplier * 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/login",);
                    },
                    minWidth: SizeConfig.screenwidth*.8,
                    color:  const Color.fromRGBO(236, 113, 33, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.black),
                    ),
                    child:  Text(
                        "Login as User",
                        style: AppTextStyle.titleTextStyle(
                            color: Colors.white,
                            fontSize: 16
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  MaterialButton(
                    minWidth: SizeConfig.screenwidth*.8,
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('/fuellogin');
                    },
                    color: const Color.fromRGBO(234, 83, 82, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text("Login as Petrolpump",  style: AppTextStyle.titleTextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
                    ),
                  ),
                ])
        ),
      ),
    );
  }
}
