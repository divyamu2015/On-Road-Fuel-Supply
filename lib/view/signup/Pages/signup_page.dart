import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/app_functions.dart';
import '../../../utilities/screen_sizer.dart';
import '../../../utilities/size_config.dart';
import '../Serviice/SignupService.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final _widthscreen = SizedBox(
    height: SizeConfig.screenheight * .02,
  );

  TextEditingController UnameController = TextEditingController();

  TextEditingController UPhonenumberController = TextEditingController();

  TextEditingController UEmailController = TextEditingController();

  TextEditingController UsernameController = TextEditingController();

  TextEditingController UpasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  height: SizeConfig.screenheight * .79,
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
                          "Signup",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _widthscreen,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a Name';
                            } else {
                              return null;
                            }
                          },
                          controller: UnameController,
                          decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                            hintText: "Name",
                            filled: true,
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ), //Name
                        _widthscreen,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter a Phonenumber';
                            } else {
                              return null;
                            }
                          },
                          controller: UPhonenumberController,
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
                              return 'Please Enter a email';
                            } else {
                              return null;
                            }
                          },
                          controller: UEmailController,
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
                              return 'Please Enter a username';
                            } else {
                              return null;
                            }
                          },
                          controller: UsernameController,
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
                              return 'Please Enter a password';
                            } else {
                              return null;
                            }
                          },
                          controller: UpasswordController,
                          decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(230, 230, 230, 1),
                            hintText: "Password",
                            filled: true,
                            prefixIcon: Icon(Icons.lock),
                            border: InputBorder.none,
                          ),
                        ),
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
                                      name: UnameController.text,
                                      phonenumber: UPhonenumberController.text,
                                      Email: UEmailController.text,
                                      username: UsernameController.text,
                                      password: UpasswordController.text);
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
                            Navigator.of(context).pushNamed('/login');
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
    //(123456);
      {
      required String name,
      required String phonenumber,
      required String Email,
      required String username,
      required String password}) async {
    print(name);
    print(phonenumber);
    try {
      final response = await getNewsList(
          name: name,
          phonenumber: phonenumber,
          Email: Email,
          username: username,
          password: password);
      if (response.status == "success") {
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sccessfully added")));
        });
        Navigator.of(context).pushNamed('/login');
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
