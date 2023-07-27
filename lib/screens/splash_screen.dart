import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4), () {
      // context.read<NewsAppCubit>().getNewsApp();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => ONBoardingScreen()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    'assets/depositphotos_471071128-stock-illustration-atletico-madrid-blue-gradient-vector-removebg-preview.png'),
              )),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 520,
                  ),
                  Container(
                    child: const Text(
                      'Sport App',
                      style: TextStyle(
                        color: Color.fromARGB(255, 175, 159,
                            175), // Assumes --text-color-1 is white

                        fontFamily: 'Poppins',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 0.8, // Assumes line-height is 80%
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
