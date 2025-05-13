import 'package:flutter/material.dart';
import 'package:fuelapp/FuelStationView/Location_View%20fS/Pages/Location_Page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../utilities/size_config.dart';
import '../../utilities/app_functions.dart';

class LocationfuelPage extends StatefulWidget {const LocationfuelPage({super.key});
  @override
  State<LocationfuelPage> createState() => _LocationfuelPageState();
}

class _LocationfuelPageState extends State<LocationfuelPage> {
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
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenwidth*.07),
              child: Text("Fuel Station Location",style:GoogleFonts.poppins(
                  color:  const Color.fromRGBO(234, 83, 82, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),),
            ),
            Container(
              width: SizeConfig.screenwidth*.8,
              height: SizeConfig.screenheight*.25,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 212, 211, 211)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,
                    left: 10),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.location_on,color:Color.fromRGBO(234, 83, 82, 1),size: 30,),
                        Text("Details",style: TextStyle(
                            color: Colors.black
                        ),)
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.person,color: Color.fromRGBO(234, 83, 82, 1),size: 30,),
                        Text("${box1?.get('name')}",style: const TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.phone,color: Color.fromRGBO(234, 83, 82, 1),size: 30,),
                        Text("${box1?.get('phone')}",style: const TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.mail,color: Color.fromRGBO(234, 83, 82, 1),size: 30,),
                        Text("${box1?.get('email')}",style: const TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),
                     Row(
                      children: [
                        const Icon(Icons.mail,color: Color.fromRGBO(234, 83, 82, 1),size: 30,),
                        Text("${box1?.get('id')}",style: const TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(onPressed: () async {
    if (await AppMethods().checkOffLine()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LocationViewFs(),));
        }
    else
      {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("You are offline")));
      }
      },child: const Icon(Icons.add),),
    );
  }

void openBox() async {
  box1 = await Hive.openBox("logindata");
  setState(() {});
}
}
