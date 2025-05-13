import 'package:flutter/material.dart';
import 'package:fuelapp/utilities/size_config.dart';

class PriceContainer extends StatefulWidget {
  const PriceContainer(
      {super.key, required this.Quantity, required this.Price});
  final String Quantity;
  final String Price;
  @override
  State<PriceContainer> createState() => _PriceContainerState();
}

class _PriceContainerState extends State<PriceContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: SizeConfig.screenwidth * .6,
        height: SizeConfig.screenheight * .2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              "Price Summary",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Quantity = ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.Quantity)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    "Price = ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "${int.parse(widget.Quantity) * int.parse(widget.Price)}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
