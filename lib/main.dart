import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:myapp/data/cubit/CountriesCubit/countries_cubit.dart';
import 'package:myapp/data/cubit/LeaguesCubit/leagues_cubit.dart';

import 'package:myapp/data/cubit/OnBoardingConroller/on_boarding_controller_cubit.dart';
import 'package:myapp/data/cubit/Playerscubit/players_cubit.dart';
import 'package:myapp/data/cubit/TeamsCubit/teams_cubit.dart';
import 'package:myapp/data/cubit/Topscorer/top_scorer_cubit.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api/firebase.dart';
import 'screens/onboarding_screen.dart';

//=======================================
// import 'package:shared_preferences/shared_preferences.dart';

// bool isOnboardingShown = false;

// Future<void> setOnboardingShown() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool('isOnboardingShown', true);
// }

// Future<bool> getOnboardingShown() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getBool('isOnboardingShown') ?? false;
// }
//=========================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await FirebaseApi().getFCMToken();
  print('Handling a background message: ${message.messageId}');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseApi().getFCMToken();
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
        BlocProvider<TopScorerCubit>(
            create: (BuildContext context) => TopScorerCubit()),
        BlocProvider<PlayersCubit>(
            create: (BuildContext context) => PlayersCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
