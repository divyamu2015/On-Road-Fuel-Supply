import 'package:flutter/material.dart';

import '../../../utilities/size_config.dart';
import '../../FuelStationList_Page/fuelListPage.dart';

class Modelsheettlocation extends StatefulWidget {
  const Modelsheettlocation({super.key, required this.locationid});
  final TextEditingController locationid;

  @override
  State<Modelsheettlocation> createState() => _ModelsheettlocationState();
}

class _ModelsheettlocationState extends State<Modelsheettlocation> {
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
                  "Location of Fuel Station:",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenheight * .05,
              width: SizeConfig.screenwidth * .4,
              color: Colors.white,
              child: TextField(
                controller: widget.locationid,
                decoration: InputDecoration(
                    hintText: "Location",
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FuelStationListPage(
                            locationidinner: widget.locationid,
                          ),
                        ));
                      },
                      icon: const Icon(Icons.location_on),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
