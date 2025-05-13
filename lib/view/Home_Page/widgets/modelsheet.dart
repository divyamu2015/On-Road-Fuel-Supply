import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fuelapp/view/Home_Page/widgets/service/orderservice.dart';

import '../../../utilities/size_config.dart';
import 'Price.dart';
import 'modelsheetlocation.dart';
import 'modelsheetwidget1.dart';
import 'modelsheetwidget2.dart';

class ModelSheet1 extends StatefulWidget {
  const ModelSheet1(
      {super.key, required this.DieselPrice, required this.PetrolPrice});
  final String DieselPrice;
  final String PetrolPrice;

  @override
  State<ModelSheet1> createState() => _ModelSheet1State();
}

class _ModelSheet1State extends State<ModelSheet1> {
  DateTime? _date;
  String selectedoption = "";
  TextEditingController Quantity = TextEditingController();
  TextEditingController Time = TextEditingController();
  TextEditingController Locationid = TextEditingController();
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState

    super.setState(fn);
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
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.maxFinite,
              height: SizeConfig.screenheight * .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      const Text('Petrol'),
                      Radio<String>(
                        value: "petrol",
                        groupValue: selectedoption,
                        onChanged: (value) {
                          setState(() {
                            selectedoption = value!;
                          });
                          print(value);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Diesel'),
                      Radio<String>(
                        value: "Diesel",
                        groupValue: selectedoption,
                        onChanged: (value) {
                          setState(() {
                            selectedoption = value!;
                          });
                          print(value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Modelsheettwidget(
            quantityconroller: Quantity,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: SizeConfig.screenheight * .25,
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              daysCount: 10,
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _date = date;
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //TimePickerDialog(initialTime: TimeOfDay.now())
          Modelsheettwidget2(
            timecontroller: Time,
          ),
          const SizedBox(
            height: 10,
          ),
          Modelsheettlocation(
            locationid: Locationid,
          ),
          const SizedBox(
            height: 30,
          ),
          (selectedoption != "" && Quantity.text != "")
              ? PriceContainer(
                  Quantity: Quantity.text.toString(),
                  Price: selectedoption == "Petrol"
                      ? widget.PetrolPrice
                      : widget.DieselPrice,
                )
              : const SizedBox(),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                Color.fromRGBO(234, 83, 82, 1),
              )),
              onPressed: () async {
                if (_date == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please select a delivery date")),
    );
    return;
  }
                final response = await orderdetail(
                    quantity: Quantity.text.toString(),
                    date: _date.toString(),
                    time: Time.text.toString(),
                    location: Locationid.text.toString(),
                    price:
                        "${int.parse(Quantity.text.toString()) * int.parse(selectedoption == "Petrol" ? widget.PetrolPrice : widget.DieselPrice)}",
                    type: selectedoption);
                if (response.status == "success") {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Sucessfully Placed Order")));
                    Navigator.of(context).pop();
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order not Placed")));
                }
                if (kDebugMode) {
                  print(Quantity.text.toString());
                  print(Time.text.toString());
                  print(_date.toString());
                  print(selectedoption);
                  print(Locationid.text.toString());
                }
              },
              child: Text(
                "Order Now",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              )),
        ],
      ),
    );
  }
}
