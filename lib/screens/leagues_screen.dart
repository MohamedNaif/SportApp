import 'package:flutter/material.dart';
import 'package:myapp/data/cubit/LeaguesCubit/leagues_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/cubit/TeamsCubit/teams_cubit.dart';
import 'package:myapp/data/cubit/Topscorer/top_scorer_cubit.dart';
import 'teams_screen.dart';

class LeaguesScreen extends StatefulWidget {
  const LeaguesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LeaguesScreen> createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> with TickerProviderStateMixin {
  late AnimationController _slideController ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _slideController = AnimationController(vsync: this , duration: ( Duration(milliseconds: 2500))) ;
    _slideController.forward() ; 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 25, 40, 1),
        title: Text('Leagues'),
      ),
      body: Container(
        color: const Color.fromRGBO(24, 25, 40, 1),
        child: BlocBuilder<LeaguesCubit, LeaguesState>(
          builder: (context, state) {
            if (state is LeaguesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LeaguesSucceed) {
              return ListView.builder(
                itemCount: state.leaguesData.result!.length,
                itemBuilder: (context, index) => SlideTransition(
                  position: index % 2 == 0 ? Tween<Offset>(begin: Offset(-1, 0) , end: Offset(0,0) ).animate(_slideController)  : Tween<Offset>(begin: Offset(1, 0) , end: Offset(0,0) ).animate(_slideController),
                  child: ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    title:
                        Text(state.leaguesData.result![index].leagueName ?? ""),
                    subtitle:
                        Text(state.leaguesData.result![index].countryName ?? ""),
                    leading: Icon(Icons.sports_soccer),
                    trailing: Image(
                      image: NetworkImage(state
                              .leaguesData.result![index].leagueLogo ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBUWl3EwrWSt-3sQKy1XDdtueBDqjo_6DKMQ&usqp=CAU"),
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images.png');
                      },
                      width: 75,
                      height: 75,
                    ),
                    onTap: () {
                      context.read<TeamsCubit>().getTeams(
                          state.leaguesData.result![index].leagueKey!, "");
                
                      context.read<TopScorerCubit>().getTopscorerData(
                          state.leaguesData.result![index].leagueKey!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Teams(
                                leagueKey:
                                    state.leaguesData.result![index].leagueKey!,
                              )),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("error"),
              );
            }
          },
        ),
      ),
    );
  }
}

// children: [
//   ListTile(
//     iconColor: Colors.white,
//     textColor: Colors.white,
//     title: Text('La Liga'),
//     subtitle: Text('Spanish football league'),
//     leading: Icon(Icons.sports_soccer),
//     trailing: Icon(Icons.arrow_forward),
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => ALeagueScreen(
//                 leagueName: '',
//               )),
//         ),
//       );
//     },
//   ),
//   ListTile(
//     iconColor: Colors.white,
//     textColor: Colors.white,
//     title: Text('Segunda División'),
//     subtitle: Text('Second-tier Spanish football league'),
//     leading: Icon(Icons.sports_soccer),
//     trailing: Icon(Icons.arrow_forward),
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => ALeagueScreen(
//                 leagueName: '',
//               )),
//         ),
//       );

//       // Navigate to Segunda División screen
//     },
//   ),
//   ListTile(
//     iconColor: Colors.white,
//     textColor: Colors.white,
//     title: Text('Copa del Rey'),
//     subtitle: Text('Spanish football cup competition'),
//     leading: Icon(Icons.sports_soccer),
//     trailing: Icon(Icons.arrow_forward),
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => ALeagueScreen(
//                 leagueName: '',
//               )),
//         ),
//       );

//       // Navigate to Copa del Rey screen
//     },
//   ),
//   ListTile(
//     iconColor: Colors.white,
//     textColor: Colors.white,
//     title: Text('La Liga'),
//     subtitle: Text('Spanish football league'),
//     leading: Icon(Icons.sports_soccer),
//     trailing: Icon(Icons.arrow_forward),

//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => ALeagueScreen(
//                 leagueName: '',
//               )),
//         ),
//       );
//     },
//     // Navigate to La Liga screen
//   ),
//   // Add more leagues here
// ],
