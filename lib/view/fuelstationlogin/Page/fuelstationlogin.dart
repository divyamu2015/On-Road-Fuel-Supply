import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../utilities/app_functions.dart';
import '../../../utilities/screen_sizer.dart';
import '../../../utilities/size_config.dart';
import '../Service/FuelSLoginService.dart';

class FuelStationLogin extends StatefulWidget {
  const FuelStationLogin({super.key});
  @override
  State<FuelStationLogin> createState() => _FuelStationLoginState();
}

class _FuelStationLoginState extends State<FuelStationLogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late Box box2;
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
      body: ScreenSetter(child:
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 113, 33, 1),
            Color.fromRGBO(234, 83, 82, 1),
          ],
              begin: Alignment.bottomRight,
              end: Alignment.centerLeft
          ),
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
                      right: SizeConfig.screenwidth * .04
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenheight * .06,
                      ),
                      Text("FuelStation \n         Login",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(
                        height: SizeConfig.screenheight * .03,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter email';
                          } else {
                            return null;
                          }
                        },
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          hintText: "Email",
                          filled: true,
                          prefixIcon: Icon(Icons.email),
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
                            return 'Please Enter Password';
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
                                  SizeConfig.heightMultiplier * .1)
                          ),
                          onPressed: () async {
                     if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        if (await AppMethods().checkOffLine()) {
                          _adddata(email: emailcontroller.text,
                              password: passwordcontroller.text);
                        }
                        else
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("You are offline")));
                        }
                      }
                          }, child: Text("Login", style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),)),
                      SizedBox(
                        height: SizeConfig.screenheight * .005,
                      ),
                      TextButton(onPressed: () {
                        Navigator.of(context).pushNamed('/fuelsignup');
                      }, child: const Text("Not a member? Signup Now", style: TextStyle(
                          color: Colors.grey
                      ),),),
                      SizedBox(
                        height: SizeConfig.screenheight * .005,
                      ),
                      TextButton(onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      }, child: const Text("Login in User Role", style: TextStyle(
                        color: Color.fromRGBO(234, 83, 82, 1),
                      ),),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
      ),
    );
  }

  Future<void> _adddata(
      {required  String email,
        required String password}) async {
     try{
       final response = await loginFs(email: email, password: password);
       if (kDebugMode) {
         print(response.data.first.username);
       }
       if (response.data.first.status== "success") {
         box2.put("isLogged", true);
         box2.put("userlogin", false);
         box2.put("username", response.data.first.username);
         box2.put("name", response.data.first.name);
         box2.put("email", response.data.first.email);
         box2.put("phone", response.data.first.phone);
         box2.put("id", response.data.first.id);
         setState(() {
           ScaffoldMessenger.of(context)
               .showSnackBar(const SnackBar(content: Text("Sucessfully logged in")));
           Navigator.of(context).pushReplacementNamed('/mainfuelhomePage');
         });
       } else {
         ScaffoldMessenger.of(context)
             .showSnackBar(const SnackBar(content: Text("Failed to login.add correct username and password")));
       }
     }
     catch(e){
       ScaffoldMessenger.of(context)
           .showSnackBar( SnackBar(content: Text(e.toString())));
     }

  }

  void createbox() async {
    box2 = await Hive.openBox('logindata');
  }
}