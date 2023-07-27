import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/coming_soon.dart';

class Categories extends StatelessWidget {
  final String name;
  // final double hightC;
  final String imageUrl;
  const Categories({
    super.key,
    required this.imageUrl,
    required this.name,
    // required this.hightC,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
        // color: const Color.fromARGB(234, 36, 37, 57),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          name,
          // 'Sport App',
          style: const TextStyle(
            color: Color.fromARGB(
                255, 231, 218, 231), // Assumes --text-color-1 is white

            fontFamily: 'Poppins',
            fontSize: 32,
            fontWeight: FontWeight.w600,
            height: 0.8, // Assumes line-height is 80%
          ),
        ),
      ),
    );
  }
}
