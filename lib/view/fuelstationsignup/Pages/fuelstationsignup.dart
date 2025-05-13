import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/app_functions.dart';
import '../../../utilities/screen_sizer.dart';
import '../../../utilities/size_config.dart';
import '../Service/fuelsservice.dart';

class SignUpScreenFuel extends StatefulWidget {
  const SignUpScreenFuel({super.key});

  @override
  State<SignUpScreenFuel> createState() => _SignUpScreenFuelState();
}

class _SignUpScreenFuelState extends State<SignUpScreenFuel> {
  final _widthscreen = SizedBox(
    height: SizeConfig.screenheight * .01,
  );

  TextEditingController FuelSNameController = TextEditingController();
  TextEditingController FuelLocationController = TextEditingController();
  TextEditingController FuelEmailController = TextEditingController();
  TextEditingController FuelSPhonenumberController = TextEditingController();
  TextEditingController FuelUsernameNameController = TextEditingController();
  TextEditingController FuelPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    FuelSNameController.dispose();
    FuelLocationController.dispose();
    FuelEmailController.dispose();
    FuelSPhonenumberController.dispose();
    FuelUsernameNameController.dispose();
    FuelPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenSetter(
            child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 113, 33, 1),
              Color.fromRGBO(234, 83, 82, 1),
            ], begin: Alignment.bottomRight, end: Alignment.centerLeft),
          ),
          child: Center(
            child: Card(
              elevation: 5,
              child: Form(
                key: _formKey,
                child: Container(
                  width: SizeConfig.screenwidth * .75,
                  height: SizeConfig.screenheight * .81,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenwidth * .04,
                        right: SizeConfig.screenwidth * .04),
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.screenheight * .02,
                        ),
                        Text(
                          "Signup Fuel\n      Station",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _widthscreen,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Fuel Station name';
                            } else {
                              return null;
                            }
                          },
                          controller: FuelSNameController,
                          decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                            hintText: "Fuel Station Name",
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ), //PoliceStationName
                        _widthscreen,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter fuel Station';
                            } else {
                              return null;
                            }
                          },
                          controller: FuelLocationController,
                          decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                            hintText: "Fuel Station Location",
                            filled: true,
                            prefixIcon: Icon(Icons.location_searching),
                            border: InputBorder.none,
                          ),
                        ), //PoliceSLocation
                        _widthscreen,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter phonenumber';
                            } else {
                              return null;
                            }
                          },
                          controller: FuelSPhonenumberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                            hintText: "Phonenumber",
                            filled: true,
                            prefixIcon: Icon(Icons.phone),
                            border: InputBorder.none,
                          ),
                        ), //PhoneNumber
                        _widthscreen,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter email';
                            } else {
                              return null;
                            }
                          },
                          controller: FuelEmailController,
                          decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                            hintText: "Email",
                            filled: true,
                            prefixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                          ),
                        ), //Email
                        _widthscreen,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter username';
                            } else {
                              return null;
                            }
                          },
                          controller: FuelUsernameNameController,
                          decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                            hintText: "UserName",
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ), //username
                        _widthscreen,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter password';
                            } else {
                              return null;
                            }
                          },
                          controller: FuelPasswordController,
                          decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                            hintText: "Password",
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            border: InputBorder.none,
                          ),
                        ), //password
                        _widthscreen,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(double.maxFinite,
                                    SizeConfig.heightMultiplier * .1)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState?.save();
                                if (await AppMethods().checkOffLine()) {
                                  adddata(
                                      name: FuelSNameController.text,
                                      phonenumber:
                                          FuelSPhonenumberController.text,
                                      email: FuelEmailController.text,
                                      username: FuelUsernameNameController.text,
                                      password: FuelPasswordController.text,
                                      location: FuelLocationController.text);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("You are offline")));
                                }
                              }
                            },
                            child: Text(
                              "Signup",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(
                          height: SizeConfig.screenheight * .01,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/fuellogin');
                          },
                          child: const Text(
                            "Already a member? Login Now",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  Future<void> adddata(
      {required String name,
      required String phonenumber,
      required String email,
      required String username,
      required String password,
      required String location}) async {
    if (kDebugMode) {
      print(name);
    }
    if (kDebugMode) {
      print(phonenumber);
    }
    try {
      final response = await getFuelSlist(
          name: name,
          phonenumber: phonenumber,
          email: email,
          username: username,
          password: password,
          location: location);
      if (response.status == "success") {
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sccessfully added")));
        });
        Navigator.of(context).pushNamed('/fuellogin');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Failed to add data")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
