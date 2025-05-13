import 'package:flutter/material.dart';

import '../../../utilities/size_config.dart';
class Modelsheettwidget2 extends StatefulWidget {
  const Modelsheettwidget2({super.key, required this.timecontroller});
  final TextEditingController timecontroller;

  @override
  State<Modelsheettwidget2> createState() => _Modelsheettwidget2State();
}


class _Modelsheettwidget2State extends State<Modelsheettwidget2> {
  Future<TimeOfDay?>?timepicked;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.only(
          top: 40,
          left: 20
      ),
      child: SizedBox(
        height: SizeConfig.screenheight*.05,
        width: SizeConfig.screenwidth*.2,
        child: Row(
          children: [
            Container(
              height: SizeConfig.screenheight*.05,
              width: SizeConfig.screenwidth*.5,
              decoration: const BoxDecoration(
                gradient:LinearGradient(colors: [
                  Color.fromRGBO(236, 113, 33, 1),
                  Color.fromRGBO(234, 83, 82, 1),
                ], begin: Alignment.bottomRight, end: Alignment.centerLeft),
              ),
              child: const Center(
                child: Text("Delivery Time:",style: TextStyle(
                    color: Colors.white
                ),),
              ),
            ),
            Container(
              height: SizeConfig.screenheight*.05,
              width: SizeConfig.screenwidth*.4,
              color: Colors.white,
              child:TextField(
                controller: widget.timecontroller,
                decoration: InputDecoration(
                    hintText: "Time",
                  suffixIcon: IconButton(
                    onPressed: () async {
                    var time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                     setState(() {
                       widget.timecontroller.text = time!.format(context);
                     });
                    },

                    icon: const Icon(
                        Icons.access_time_outlined
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
