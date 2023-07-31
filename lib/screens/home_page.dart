import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/data/cubit/HomePageCubit/home_page_cubit.dart';
import 'package:myapp/global/categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/cubit/CountriesCubit/countries_cubit.dart';
import 'coming_soon.dart';
import 'countries_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _slideController;
  @override
  void initState() {
    super.initState();
    _slideController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _slideController.forward();
  }

  void forward() {
    _slideController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _slideController.forward();
  }

  List<String> imageUrl = [
    'assets/mainimg.jpeg',
    'assets/base1.jpg',
    'assets/handball.jpg',
    'assets/Tennis.jpg'
  ];
  List<String> sportName = ["Football", "Basketball", "HandBall", "Tennis"];
  List<List<double>> offSet = [
    [-2, -2],
    [2, -2],
    [-2, 2],
    [2, 2]
  ];
  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.height;
    var screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenH,
        width: screenW,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/timothy-tan-PAe2UhGo-S4-unsplash.jpg'),
              fit: BoxFit.cover),
          color: Color.fromRGBO(24, 25, 40, 1),
        ),
        child: BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            if (context.read<HomePageCubit>().isvalid) {
              return Container(
                color: const Color.fromARGB(221, 36, 37, 57),
                height: screenH,
                width: screenW,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, i) => SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(offSet[i][0], offSet[i][1]),
                                  end: const Offset(0, 0))
                              .animate(_slideController),
                          child: InkWell(
                            onTap: () {
                              if (i == 0) {
                                context
                                    .read<CountriesCubit>()
                                    .getCountriesDate();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const CountriesScreen())));
                              } else {
                                context.read<HomePageCubit>().valid();
                              }
                            },
                            child: Categories(
                              imageUrl: imageUrl[i],
                              name: sportName[i],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Dialog(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Coming soon',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'This feature is currently under development and will be available soon.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomePageCubit>().valid();
                          forward();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}



// child: Container(
                    
                  //   margin: EdgeInsets.symmetric(
                  //       vertical: MediaQuery.of(context).size.height * 0.3,
                  //       horizontal: MediaQuery.of(context).size.width * 0.04),
                  //   decoration: BoxDecoration(
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.5),
                  //         blurRadius: 8,
                  //         spreadRadius: 15,
                  //       ),
                  //     ],
                  //   ),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(15),
                  //     child: Image.asset(
                  //       'assets/come.jpg',
                  //       fit: BoxFit.contain,
                  //       width: double.infinity,
                  //       height: double.infinity,
                  //     ),
                  //   ),
                  // ),