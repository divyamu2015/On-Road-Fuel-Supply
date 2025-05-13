import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../constatnts/app_images.dart';
import '../../utilities/app_style.dart';
import '../../utilities/screen_sizer.dart';
import '../Welcome_Page/welcome_page.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenSetter(
        child: IntroductionScreen(
          showNextButton: true,
          next: const Icon(Icons.arrow_forward_outlined),
          showSkipButton: true,
          done: const Text("Done",
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          onDone: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>  const WelocomePage(),
          )),
          skip: const Text("Skip",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          onSkip: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>  const WelocomePage(),
          )),
          dotsDecorator: DotsDecorator(
            //size: Size(12, 20),
            activeSize: const Size(10, 20),
            color: Colors.grey,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            activeColor: Colors.blue,
          ),
          pages: [
            PageViewModel(
                decoration: const PageDecoration(imageFlex: 3),
                titleWidget: Text(
                  "Fuel Delivery app",
                  style: AppTextStyle.boldTitleStyle(fontSize: 20),
                ),
                //title: "Crime Reporting app",
                bodyWidget: Text("Get fuel anywhere, anytime",
                    style: AppTextStyle.titleTextStyle(fontSize: 15)),
                image: Image.asset(AppImages.Fuelsupply)),
            PageViewModel(
              decoration: const PageDecoration(imageFlex: 3),
              titleWidget: Text(
                "    Get Details about The\n    Surronding Fuel Station",
                style: AppTextStyle.boldTitleStyle(fontSize: 20),
              ),
              //title: "Crime Reporting app",
              bodyWidget: Text(
                  "User can get information about fuelstation\n      and statusreport of fuel delevery",
                  style: AppTextStyle.titleTextStyle(fontSize: 15)),
              image: Image.asset(AppImages.fuelstation),
            ),
          ],
        ),
      ),
    );
  }
}
