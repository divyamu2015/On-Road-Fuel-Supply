import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../utilities/size_config.dart';
import '../Service/Myorder.dart';
class OrdersPage extends StatefulWidget {
   const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
    return Padding(padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenwidth * .07),
            child: Text("My Orders", style: GoogleFonts.poppins(
                color: const Color.fromRGBO(234, 83, 82, 1),
                fontWeight: FontWeight.bold,
                fontSize: 40
            ),),
          ),
          FutureBuilder(
            future: getUserorderRepo(),
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
                }
                else if (snapshot.data!.data.isNotEmpty) {
                  return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: SizeConfig.screenwidth * .8,
                          height: SizeConfig.screenheight * .4,
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,
                                left: 10),
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start  ,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.local_gas_station,
                                      color: Color.fromRGBO(234, 83, 82, 1),
                                      size: 30,),
                                    Text(
                                      "Order Number=${snapshot.data?.data[index]
                                          .id}", style: const TextStyle(
                                        color: Colors.black
                                    ),)
                                  ],
                                ),
                                size,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    const Column(
                                      children: [
                                        Icon(Icons.check, color: Colors.green,
                                          size: 15,),
                                        Text("In Progress", style: TextStyle(
                                            color: Color.fromRGBO(
                                                234, 83, 82, 1),
                                            fontSize: 10
                                        ),)
                                      ],
                                    ),
                                    widthh,
                                    Column(
                                      children: [
                                        (snapshot.data?.data[index]
                                            .dlvryStatus == "completed"||snapshot.data?.data[index]
                                            .dlvryStatus == "started")?
                                        const Icon(Icons.check, color: Colors.green,
                                          size: 15,) :
                                        const CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            radius: 20,
                                            child: Text("2", style: TextStyle(
                                                color: Colors.white
                                            ),)
                                        ),
                                        const Text(
                                          "Delivery Started", style: TextStyle(
                                            color: Color.fromRGBO(
                                                234, 83, 82, 1),
                                            fontSize: 10
                                        ),)
                                      ],
                                    ),
                                    widthh,
                                    Column(
                                      children: [
                                        snapshot.data?.data[index]
                                            .dlvryStatus == "completed" ?
                                        const Icon(Icons.check, color: Colors.green,
                                          size: 15,) :
                                        const CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            radius: 20,
                                            child: Text("3", style: TextStyle(
                                                color: Colors.white
                                            ),)
                                        ),
                                        const Text("Delivered", style: TextStyle(
                                            color: Color.fromRGBO(
                                                234, 83, 82, 1),
                                            fontSize: 10
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          "Product", style: TextStyle(
                                            color: Colors.grey
                                        ),),
                                        Text("${snapshot.data?.data[index]
                                            .type}", style: const TextStyle(
                                            color: Color.fromRGBO(
                                                234, 83, 82, 1),
                                            fontSize: 10
                                        ),)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text("Price", style: TextStyle(
                                            color: Colors.grey
                                        ),),
                                        Text("${snapshot.data?.data[index]
                                            .price}", style: const TextStyle(
                                            color: Color.fromRGBO(
                                                234, 83, 82, 1),
                                            fontSize: 10
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text("Date", style: TextStyle(
                                            color: Colors.grey
                                        ),),
                                        Text("${snapshot.data?.data[index]
                                            .date}", style: const TextStyle(
                                            color: Color.fromRGBO(
                                                234, 83, 82, 1),
                                            fontSize: 10
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const Text("Time To deliever",
                                          style: TextStyle(
                                              color: Colors.grey
                                          ),),
                                        Text("${snapshot.data?.data[index]
                                            .time}", style: const TextStyle(
                                            color: Color.fromRGBO(
                                                234, 83, 82, 1),
                                            fontSize: 10
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10,);
                      },
                      itemCount: snapshot.data!.data.length);
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
                child: Text("Server Error,Try Afrer SomeTime", style: TextStyle(
                    fontSize: 15
                ),),
              );
            },
          ),
        ],
      ),
    );
  }

  void openBox() async {
    box1 = await Hive.openBox('logindata');
    setState(() {});
  }
}
