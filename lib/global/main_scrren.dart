import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainScreen extends StatelessWidget {
  final String? textOnBoarding;
  const MainScreen({super.key, this.textOnBoarding});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/mainimg.jpeg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              color: const Color.fromARGB(234, 36, 37, 57),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 520,
                  ),
                  Container(
                    child: Text(
                      textOnBoarding!,
                      style: const TextStyle(
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
