import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/main.dart';
import 'package:myapp/screens/onboarding_screen.dart';
import 'package:myapp/screens/test_screen.dart';

import '../global/main_scrren.dart';
import 'home_page.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _appearController;
  @override
  void initState() {
    super.initState();
    _appearController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _appearController.forward();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      // context.read<NewsAppCubit>().getNewsApp();
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: ((context) => ONBoardingScreen()),
      //   ),
      // );
      //================================================
      if (MyApp().showHome == false) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => ONBoardingScreen()),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => HomePage()),
          ),
        );
      }
      //=================================================
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/1eb5deb4eb282a73c3703b5ede9ff53a.jpeg'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              color: const Color.fromARGB(234, 36, 37, 57),
            ),
            FadeTransition(
              opacity: _appearController,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      'assets/depositphotos_471071128-stock-illustration-atletico-madrid-blue-gradient-vector-removebg-preview.png'),
                )),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // width: double.infinity,
                  padding: EdgeInsets.only(bottom: screenH / 7),
                  child: Center(
                    child: FadeTransition(
                      opacity: _appearController,
                      child: const Text(
                        'Sport App',
                        style: TextStyle(
                          color:
                              Colors.white, // Assumes --text-color-1 is white

                          fontFamily: 'Poppins',
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          height: 0.8, // Assumes line-height is 80%
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
