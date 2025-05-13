import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../constatnts/app_images.dart';
import '../../../utilities/size_config.dart';
import '../Order_Details/Pages/order_detailspage.dart';
import 'Service/fuelorderservice.dart';
class HomePageFuelStation extends StatefulWidget {
  const HomePageFuelStation({super.key});

  @override
  State<HomePageFuelStation> createState() => _HomePageFuelStationState();
}
List<Widget> pictures=[
  Container(
    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppImages.fuelposter1),fit: BoxFit.cover)),
  ),
  Container(
    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppImages.fuelposter2),fit: BoxFit.cover)),
  ),


];
class _HomePageFuelStationState extends State<HomePageFuelStation> {
  Box? box1;

  @override
  void initState() {
    // TODO: implement initState
    openBox();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.screenwidth*.07,top: SizeConfig.screenheight*.05),
          child: Text("Hello ${box1?.get('username')}",style:GoogleFonts.poppins(
              color: const Color.fromRGBO(82, 85, 84, 1),
              fontWeight: FontWeight.bold,
              fontSize:20
          ),),
        ),
        SizedBox(
          height: SizeConfig.screenheight*.01,
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.screenwidth*.07),
          child: Text("Welcome",style:GoogleFonts.poppins(
              color:  const Color.fromRGBO(234, 83, 82, 1),
              fontWeight: FontWeight.bold,
              fontSize: 40
          ),),
        ),
        SizedBox(
          height: SizeConfig.screenheight*.05,
        ),
        CarouselSlider(items: pictures, options: CarouselOptions(
          autoPlayAnimationDuration:const Duration(
              seconds: 2
          ),
          autoPlay: true,
          enlargeCenterPage: true,
          height: 200,
          autoPlayCurve: Curves.elasticInOut,
        )),
        SizedBox(
          height: SizeConfig.screenheight*.05,
        ),
        Padding(
          padding:EdgeInsets.only(left: SizeConfig.screenwidth*.07),
          child: Text("Order List",style:GoogleFonts.poppins(
              color:  const Color.fromRGBO(82, 85, 84, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(
          height: SizeConfig.screenheight*.01,
        ),
//         FutureBuilder(future:getUserorderListRepo() , builder:(context, snapshot) {
//           if(snapshot.connectionState==ConnectionState.done)
// {}
//         },)
    FutureBuilder(
          future: getUserorderListRepo(),
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder:(context, index) {
                        return snapshot.data?.data[index].dlvryStatus!="completed"?Card(
                          elevation: 5,
                          child: Container(
                            width: SizeConfig.screenwidth*.8,
                            height: SizeConfig.screenheight*.25,
                            decoration: const BoxDecoration(
                                color: Colors.white
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.only(top: 10,
                                  left: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.local_gas_station,color:Color.fromRGBO(234, 83, 82, 1),size: 30,),
                                      const SizedBox(width: 10,),
                                      Text(snapshot.data!.data[index].id.toString(),style: const TextStyle(
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 2,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today,color: Color.fromRGBO(234, 83, 82, 1),size: 30,),
                                      const SizedBox(width: 10,),
                                      Text(snapshot.data!.data[index].date,style: const TextStyle(
                                          color: Colors.black
                                      ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.lock_clock,color: Color.fromRGBO(234, 83, 82, 1),size: 30,),
                                      const SizedBox(width: 10,),
                                      Text(snapshot.data!.data[index].time,style: const TextStyle(
                                          color: Colors.black
                                      ),),
                                    ],
                                  ),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor: WidgetStatePropertyAll( Color.fromRGBO(234, 83, 82, 1),)
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersFuelPage(  data1: snapshot.data!.data[index],),));
                                      }, child: const Text(
                                    "Confirm order",style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  ),
                                  )),
                                ],
                              ),

                            ),
                          ),
                        ):const SizedBox(
                        );
                      }, separatorBuilder: (context, index) {
                    return const SizedBox(height: 10,);
                  }, itemCount: snapshot.data!.data.length),
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
              child: Text("Error",style: TextStyle(
                  fontSize: 15
              ),),
            );
          },
        ),
        SizedBox(
          height:SizeConfig.screenheight*.1,
        ),
      ],
    );
  }
  void openBox() async {
    box1 = await Hive.openBox("logindata");
    setState(() {});
  }
}
