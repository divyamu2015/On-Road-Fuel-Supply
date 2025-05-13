import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../utilities/size_config.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final size = SizedBox(
    height: SizeConfig.screenheight * .04,
  );
  TextEditingController phonenumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  Box? box1;
  @override
  void initState() {
    // TODO: implement initState
    openBox();
    super.initState();
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    phonenumber.text = "${box1?.get('phone')}";
     name.text = "${box1?.get('name')}";
     email.text = "${box1?.get('email')}";
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenwidth * .07),
            child: Text(
              "My Profile",
              style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(234, 83, 82, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          size,
          const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 50,
              )),
          size,
          TextField(
            controller: phonenumber,
            decoration: InputDecoration(
                label: const Text("Phone number"),
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white),
          ),
          size,
          TextField(
            controller: email,
            decoration: InputDecoration(
                label: const Text("Email"),
                prefixIcon: const Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white),
          ),
          size,
          TextField(
            controller: name,
            decoration: InputDecoration(
                label: const Text("Name"),
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white),
          ),
          size,
          
        ],
      ),
    );
  }

  void openBox() async {
    box1 = await Hive.openBox("logindata");
    setState(() {});
  }
}
