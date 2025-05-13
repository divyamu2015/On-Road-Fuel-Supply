import 'package:flutter/material.dart';
import 'package:fuelapp/FuelStationView/Location_View%20fS/lservice/locationservice.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

import '../../../utilities/size_config.dart';

class ModelSheetLocationFs extends StatefulWidget {
  const ModelSheetLocationFs({super.key, required this.finalposition});
  final LatLng finalposition;
  @override
  State<ModelSheetLocationFs> createState() => _ModelSheetLocationFsState();
}

class _ModelSheetLocationFsState extends State<ModelSheetLocationFs> {
  final size = SizedBox(
    height: SizeConfig.screenheight * .04,
  );
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController locationlonglangc = TextEditingController();
  Box? box1;

  @override
  void initState() {
    // TODO: implement initState
    locationlonglangc.text =
        "${widget.finalposition.longitude},${widget.finalposition.latitude}";
    openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(50, 57, 73, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      height: SizeConfig.screenheight * .8,
      width: double.maxFinite,
      child: ListView(
        children: [
          size,
          TextField(
            controller: locationlonglangc,
            readOnly: true,
            decoration: InputDecoration(
                hintText: "Longitude,Langitude",
                prefixIcon: const Icon(Icons.add_location),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white),
          ),
          size,
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                Color.fromRGBO(234, 83, 82, 1),
              )),
              onPressed: () {
                _adddata(locationlatlong: locationlonglangc.text);
              },
              child: const Text(
                "Save Address",
                style: TextStyle(fontSize: 26),
              )),
        ],
      ),
    );
  }

  Future<void> _adddata({required String locationlatlong}) async {
    final response =
        await locationrepoFs(LongLat: locationlatlong, id: box1?.get('id'));
    if (response.status == "success") {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 5),
            content: Text("Sucessfully location selected")));
        // Navigator.of(context).pop();
        Navigator.of(context).pushNamed('/mainfuelhomePage');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 5),
          content: Text("Failed to Add Location,Plaease try again")));
      //Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/mainfuelhomePage');
    }
  }

  void openBox() async {
    box1 = await Hive.openBox("logindata");
    setState(() {});
  }
}
