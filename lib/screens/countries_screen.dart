import 'package:flutter/material.dart';
import 'package:myapp/data/cubit/CountriesCubit/countries_cubit.dart';
import 'package:myapp/data/cubit/LeaguesCubit/leagues_cubit.dart';
import 'package:myapp/data/model/CountriesModel/countries_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/repo/LeaguesRepo/leagues_repo.dart';
import 'leagues_screen.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 25, 40, 1),
        title: Text('Countries'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(24, 25, 40, 1),
        child: BlocBuilder<CountriesCubit, CountriesState>(
          builder: (context, state) {
            if (state is CountriesError) {
              return Center(
                child: Text(" Error "),
              );
            } else if (state is CountriesSucceed) {
              return GridView.builder(
                padding: EdgeInsets.all(20),
                itemCount: state.countriesData.result!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.read<LeaguesCubit>().getLeaguesData(
                        state.countriesData.result![index].countryKey!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeaguesScreen(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          state.countriesData.result![index].countryLogo ??
                              "assets/style.jpg"),
                    )),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        state.countriesData.result![index].countryName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

// body: Container(
//         color: const Color.fromRGBO(24, 25, 40, 1),
//         child: GridView.count(
//           crossAxisCount: 2,
//           children: const [
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'USA',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'UK',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'France',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'Germany',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'Italy',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'Spain',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'Spain',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'Spain',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'Spain',
//             ),
//             CountryCard(
//               imagePath: 'assets/images (1).jpeg',
//               countryName: 'Spain',
//             ),
//           ],
//         ),
//       ),

// class CountryCard extends StatelessWidget {
//   final String imagePath;
//   final String countryName;

//   const CountryCard({
//     Key? key,
//     required this.imagePath,
//     required this.countryName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: ((context) => LeaguesScreen(

//                 )),
//           ),
//         );
//       },
//       child: Card(
//         margin: EdgeInsets.all(15),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         elevation: 5,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Stack(
//             children: [
//               Image.asset(
//                 imagePath,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: double.infinity,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       Colors.black.withOpacity(0.5),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 left: 10,
//                 child: Text(
//                   countryName,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
