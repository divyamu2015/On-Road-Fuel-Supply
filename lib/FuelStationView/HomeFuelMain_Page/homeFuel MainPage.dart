import 'package:flutter/material.dart';
import 'package:fuelapp/FuelStationView/FuelLocationPage/fuellocation.dart';
import 'package:hive/hive.dart';

import '../../view/Account_Page/Pages/account_Page.dart';
import '../../view/Splash_Screen/splash_screen.dart';
import '../HomePage/HomeFuel_Page.dart';

class MainFuelHomePage extends StatefulWidget {
  const MainFuelHomePage({super.key});

  @override
  State<MainFuelHomePage> createState() => _MainFuelHomePageState();
}

int _currentIndex = 2;
final List<Widget> _screens = [
  const LocationfuelPage(),
  const HomePageFuelStation(),
  const AccountPage()
];

class _MainFuelHomePageState extends State<MainFuelHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Box? box1;

  @override
  void initState() {
    // TODO: implement initState
    openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromRGBO(234, 242, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(50, 57, 73, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            } else {
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
        ),
        title: TextButton(
          onPressed: () {
            setState(() {
              _currentIndex = 0;
            });
          },
          child: const Text(
            "Location",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
        ],
      ),
      body: _screens[_currentIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(236, 113, 33, 1),
                  Color.fromRGBO(234, 83, 82, 1),
                ], begin: Alignment.bottomRight, end: Alignment.centerLeft),
              ),
              accountName: Text("${box1?.get('name')}"),
              accountEmail: Text("${box1?.get('username')}"),
              currentAccountPicture: const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 50,
                  )),
            ),
            const Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
              child: const ListTile(
                leading: Icon(Icons.local_gas_station),
                title: Text("Home"),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
              child: const ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Location"),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
              child: const ListTile(
                leading: Icon(Icons.person),
                title: Text("Account"),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                box1?.put("isLogged", false);
                box1?.delete("username");
                box1?.delete("id");
                box1?.delete("name");
                box1?.delete("phone");
                box1?.delete("email");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.cyan),
        backgroundColor: const Color.fromRGBO(50, 57, 73, 1),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(50, 57, 73, 1),
              icon: Icon(
                Icons.location_on_outlined,
              ),
              label: "Location"),
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(50, 57, 73, 1),
              icon: Icon(
                Icons.local_gas_station,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(50, 57, 73, 1),
              icon: Icon(
                Icons.person,
              ),
              label: "Account"),
        ],
      ),
    );
  }

  void openBox() async {
    box1 = await Hive.openBox("logindata");
    setState(() {});
  }
}
