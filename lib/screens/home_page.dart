import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/global/categories.dart';

import 'coming_soon.dart';
import 'countries_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(24, 25, 40, 1),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => CountriesScreen()),
                        ),
                      );
                    },
                    child: const Categories(
                      imageUrl: 'assets/mainimg.jpeg',
                      name: 'Football',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ComingSoon()),
                        ),
                      );
                    },
                    child: const Categories(
                      imageUrl: 'assets/basketball.jpg',
                      name: 'BasketBall',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ComingSoon()),
                        ),
                      );
                    },
                    child: const Categories(
                      imageUrl: 'assets/handball.jpg',
                      name: 'HandBall',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ComingSoon()),
                        ),
                      );
                    },
                    child: const Categories(
                      imageUrl: 'assets/Tennis.jpg',
                      name: 'Tennis',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
