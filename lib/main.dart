import 'package:flutter/material.dart';
import 'package:myapp/data/cubit/CountriesCubit/countries_cubit.dart';
import 'package:myapp/data/cubit/LeaguesCubit/leagues_cubit.dart';

import 'package:myapp/data/cubit/OnBoardingConroller/on_boarding_controller_cubit.dart';
import 'package:myapp/data/cubit/TeamsCubit/teams_cubit.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnBoardingControllerCubit>(
            create: (BuildContext context) => OnBoardingControllerCubit()),
        BlocProvider<CountriesCubit>(
            create: (BuildContext context) => CountriesCubit()),
        BlocProvider<LeaguesCubit>(
            create: (BuildContext context) => LeaguesCubit()),
        BlocProvider<TeamsCubit>(
            create: (BuildContext context) => TeamsCubit()),    
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ONBoardingScreen(),
      ),
    );
  }
}
