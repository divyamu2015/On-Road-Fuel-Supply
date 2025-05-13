import 'package:flutter/material.dart';
import 'package:fuelapp/FuelStationView/Order_Details/service/order_service.dart';
import 'package:fuelapp/utilities/screen_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utilities/size_config.dart';
import '../../../utilities/app_functions.dart';
import '../../HomePage/Model/fuelorderlist.dart';
class OrdersFuelPage extends StatelessWidget {
  OrdersFuelPage( {super.key, required this.data1, });
  final Datum data1;
  final size = SizedBox(
    height: SizeConfig.screenheight * .04,
  );
  final widthh = SizedBox(
    width: SizeConfig.screenwidth * .05,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),
      child: ScreenSetter(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(234, 242, 255, 1),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenwidth*.07),
                child: Text("Order",style:GoogleFonts.poppins(
                    color:  const Color.fromRGBO(234, 83, 82, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: SizeConfig.screenwidth*.8,
                  height: SizeConfig.screenheight*.25,
                  decoration: const BoxDecoration(
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,
                        left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.local_gas_station,color:Color.fromRGBO(234, 83, 82, 1),size: 30,),
                            Text(data1.id.toString(),style: const TextStyle(
                                color: Colors.black
                            ),)
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: SizeConfig.screenwidth*.15),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("Product",style: TextStyle(
                                      color: Colors.grey
                                  ),),
                                  Text(data1.type,style: const TextStyle(
                                      color:Color.fromRGBO(234, 83, 82, 1),
                                      fontSize: 10
                                  ),)
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: SizeConfig.screenwidth*.17) ,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("Price",style: TextStyle(
                                      color: Colors.grey
                                  ),),
                                  Text(data1.price,style: const TextStyle(
                                      color:Color.fromRGBO(234, 83, 82, 1),
                                      fontSize: 10
                                  ),)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                          children: [
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll( Color.fromRGBO(234, 83, 82, 1),)
                                ),
                                onPressed: () async {
                                   if (await AppMethods().checkOffLine()) {
                                     try{
                                       final response = await DeliveryStartedRepo(id: data1.id.toString(), staus: 'started');
                                       if(response.message=="success")
                                       {
                                         ScaffoldMessenger.of(context)
                                             .showSnackBar(const SnackBar(content: Text("Delivery Started")));
                                       }
                                       else
                                       {
                                         ScaffoldMessenger.of(context)
                                             .showSnackBar(const SnackBar(content: Text("Error")));
                                       }
                                     }catch(e)
                                     {
                                       ScaffoldMessenger.of(context)
                                           .showSnackBar( SnackBar(content: Text(e.toString())));
                                     }
                                   }
                                   else
                                     {
                                       ScaffoldMessenger.of(context)
                                           .showSnackBar(const SnackBar(content: Text("You are offline")));
                                     }

                                }, child: const Text(
                              "Delivery Started",style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                            ),
                            )),
                            widthh,
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll( Color.fromRGBO(234, 83, 82, 1),)
                                ),
                                onPressed: () async {
                                 if (await AppMethods().checkOffLine()) {
                                   try{
                                     final response = await DeliveryStartedRepo(id: data1.id.toString(), staus: 'completed');
                                     if(response.message=="success")
                                     {
                                       ScaffoldMessenger.of(context)
                                           .showSnackBar(const SnackBar(content: Text("Delivery Started")));
                                     }
                                     else
                                     {
                                       ScaffoldMessenger.of(context)
                                           .showSnackBar(const SnackBar(content: Text("Error")));
                                     }
                                   }catch(e)
                                  {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar( SnackBar(content: Text(e.toString())));
                                  }
                                 }
                                 else
                                   {
                                     ScaffoldMessenger.of(context)
                                         .showSnackBar(const SnackBar(content: Text("You are offline")));
                                   }

                                }, child: const Text(
                              "Delievered",style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                            ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
