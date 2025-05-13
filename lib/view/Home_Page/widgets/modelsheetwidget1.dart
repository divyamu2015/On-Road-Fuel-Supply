import 'package:flutter/material.dart';

import '../../../utilities/size_config.dart';

typedef GetData = String Function(String);

class Modelsheettwidget extends StatefulWidget {
  final TextEditingController quantityconroller;
  const Modelsheettwidget({super.key, required this.quantityconroller});

  @override
  State<Modelsheettwidget> createState() => _ModelsheettwidgetState();
}

class _ModelsheettwidgetState extends State<Modelsheettwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20),
      child: SizedBox(
        height: SizeConfig.screenheight * .05,
        width: SizeConfig.screenwidth * .2,
        child: Row(
          children: [
            Container(
              height: SizeConfig.screenheight * .05,
              width: SizeConfig.screenwidth * .5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(236, 113, 33, 1),
                  Color.fromRGBO(234, 83, 82, 1),
                ], begin: Alignment.bottomRight, end: Alignment.centerLeft),
              ),
              child: const Center(
                child: Text(
                  "Quantity in lts:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenheight * .05,
              width: SizeConfig.screenwidth * .4,
              color: Colors.white,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: widget.quantityconroller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
