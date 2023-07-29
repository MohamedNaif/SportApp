import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:myapp/data/cubit/CountriesCubit/countries_cubit.dart';
import 'package:myapp/data/cubit/OnBoardingConroller/on_boarding_controller_cubit.dart';
import 'package:myapp/screens/countries_screen.dart';
import 'package:myapp/screens/home_page.dart';
import 'dart:async';

import 'package:myapp/screens/leagues_screen.dart';

class ONBoardingScreen extends StatefulWidget {
  ONBoardingScreen({super.key});

  @override
  State<ONBoardingScreen> createState() => _ONBoardingScreenState();
}

class _ONBoardingScreenState extends State<ONBoardingScreen> {
  final int pageNum = 3;

  PageController _pageController = PageController(initialPage: 1);

  Timer? _timer;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < pageNum + 1) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        // If last page is reached, go to the first page
        _currentPage = 1;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 900),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Expanded(
            flex: 2,
            child: PageView.builder(
                controller: _pageController,
                itemCount: 5,
                onPageChanged: (i) {
                  if (i == pageNum + 1) {
                    _pageController.jumpToPage(1);
                    i = 1;
                  } else if (i == 0) {
                    _pageController.animateToPage(3,
                        duration: Duration(milliseconds: 40),
                        curve: Curves.easeIn);
                  }
                  _currentPage = i;
                  context.read<OnBoardingControllerCubit>().getIndex(i);
                },
                itemBuilder: (context, index) => Container(
                    color: const Color.fromRGBO(24, 25, 40, 1),
                    child: Center(
                        child: Text(
                      "page $index",
                      style: TextStyle(color: Colors.white),
                    ))))),
        Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromRGBO(24, 25, 40, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<OnBoardingControllerCubit,
                      OnBoardingControllerState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              3,
                              (indx) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    margin: const EdgeInsets.all(2.5),
                                    height: 6,
                                    width: context
                                                .read<
                                                    OnBoardingControllerCubit>()
                                                .currentIndex ==
                                            indx + 1
                                        ? 20
                                        : 6,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ))
                        ],
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      _timer?.cancel();
                      context.read<CountriesCubit>().getCountriesDate();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                          child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4568DC),
                              Color(0xFFB06AB3),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.0, 1.0],
                          ),
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )
                ],
              ),
            ))
      ],
    )));
  }
}
