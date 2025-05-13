import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../utilities/app_functions.dart';
import '../../../utilities/screen_sizer.dart';
import '../../../utilities/size_config.dart';
import '../Service/LoginService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late Box box1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    createbox();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   automaticallyImplyLeading: true,
      // ),
      body: ScreenSetter(
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
                height: SizeConfig.screenheight * .6,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.screenwidth * .04,
                      right: SizeConfig.screenwidth * .04),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenheight * .06,
                      ),
                      Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenheight * .03,
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter email';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          hintText: "Email",
                          filled: true,
                          prefixIcon: Icon(Icons.mail),
                          border: InputBorder.none,

                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenheight * .03,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter password';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordcontroller,
                        decoration: const InputDecoration(
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          hintText: "Password",
                          filled: true,
                          prefixIcon: Icon(Icons.lock),
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenheight * .03,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(double.maxFinite,
                                  SizeConfig.heightMultiplier * .11)),
                          onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        if (await AppMethods().checkOffLine()) {
                          _adddata(
                              email: emailcontroller.text.trim(),
                              password: passwordcontroller.text.trim());
                        }
                        else
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("You are offline")));
                        }
                      }
                      //Navigator.of(context).pushReplacementNamed('/mainhomePage');
                          },
                          child: Text(
                            "Login",
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
                          Navigator.of(context).pushNamed('/signupimage');
                        },
                        child: const Text(
                          "Not a member? Signup Now",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenheight * .005,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }

  Future<void> _adddata(
      {required String email, required String password}) async {
    try{
      final response = await login(email: email, password: password);
      if (kDebugMode) {
        print(response.data.first.username);
      }
      if (response.data.first.status == "success") {
        box1.put("isLogged", true);
        box1.put("userlogin", true);
        box1.put("username", response.data.first.username);
        box1.put("name", response.data.first.name);
        box1.put("email", response.data.first.email);
        box1.put("phone", response.data.first.phone);
        box1.put("id", response.data.first.id);
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sucessfully logged in")));
          Navigator.of(context).pushReplacementNamed('/mainhomePage');
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Failed to login.add correct username and password")));
      }
    }
    catch(e)
    {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void createbox() async {
    box1 = await Hive.openBox('logindata');
  }
}
