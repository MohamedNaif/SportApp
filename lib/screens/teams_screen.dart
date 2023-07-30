import 'package:flutter/material.dart';
import 'package:myapp/data/cubit/Playerscubit/players_cubit.dart';
import 'package:myapp/data/cubit/TeamsCubit/teams_cubit.dart';
import 'package:myapp/data/cubit/Topscorer/top_scorer_cubit.dart';
import 'package:myapp/screens/players_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Teams extends StatelessWidget {
  final int leagueKey;

  Teams({required this.leagueKey});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(24, 25, 40, 1),
          title: const Text('La Liga'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Teams'),
              Tab(
                text: 'Top Scorers',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Overview screen
            Container(
              color: Colors.white,
              child: Center(
                child: TeamsScreen(leagueKey: leagueKey),
              ),
            ),
            // Teams screen

            // Top Scorers screen
            const TopScorersScreen(),
          ],
        ),
      ),
    );
  }
}

class TeamsScreen extends StatefulWidget {
  final int leagueKey;
  const TeamsScreen({required this.leagueKey});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> with TickerProviderStateMixin{
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
    TextEditingController? search = TextEditingController(text: "");
    return Scaffold(
      body: Container(
        color: Colors.white10,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  hintText: 'Search for a team',
                  suffixIcon: InkWell(
                      onTap: () => context
                          .read<TeamsCubit>()
                          .getTeams(widget.leagueKey, search.text),
                      child: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<TeamsCubit, TeamsState>(
                builder: (context, state) {
                  if (state is TeamsSucceed) {
                    return GridView.builder(
                        itemCount: state.teamsData.result!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return SlideTransition(
                            position: index % 2 == 0 ? Tween<Offset>(begin: Offset(-1, 0) , end: Offset(0,0) ).animate(_slideController)  : Tween<Offset>(begin: Offset(1, 0) , end: Offset(0,0) ).animate(_slideController),
                            child: InkWell(
                              onTap: () {
                                context.read<PlayersCubit>().getPlayersData(
                                    "${state.teamsData.result![index].teamKey!}",
                                    "",
                                    '');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Players(
                                        teamId:
                                            "${state.teamsData.result![index].teamKey!}",
                                      ),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    image: DecorationImage(
                                        onError: (exception, stackTrace) {
                                          Image.asset('assets/images.png');
                                        },
                                        image: NetworkImage(state.teamsData
                                                .result![index].teamLogo ??
                                            'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg'))),
                                margin: const EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      state.teamsData.result![index].teamName ??
                                          '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else if (state is TeamsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(
                      child: Text(
                        "NO Result",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopScorersScreen extends StatefulWidget {
  const TopScorersScreen({Key? key}) : super(key: key);

  @override
  State<TopScorersScreen> createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> with TickerProviderStateMixin {
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
      body: BlocBuilder<TopScorerCubit, TopScorerState>(
        builder: (context, state) {
          if (state is TopScorerSucceed) {
            return ListView.builder(
              itemCount: state.topscorerData.result!.length,
              itemBuilder: (BuildContext context, int index) {
                return SlideTransition(
                  position: index % 2 == 0 ? Tween<Offset>(begin: Offset(-1, 0) , end: Offset(0,0) ).animate(_slideController)  : Tween<Offset>(begin: Offset(1, 0) , end: Offset(0,0) ).animate(_slideController),
            child: ListTile(
                    trailing: Icon(Icons.sports_soccer),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/football-player-abstract-shadow-art_9955-1139.jpg?w=2000'),
                    ),
                    title: Text(
                      state.topscorerData.result![index].playerName ?? "",
                      // player['playerName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    subtitle: Text(
                      '${(state.topscorerData.result![index].teamName ?? '')} - ${(state.topscorerData.result![index].goals ?? '')} Goals',
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is TopScorerLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("No players found " , style: TextStyle(fontSize: 30 , fontWeight:  FontWeight.w700),));
          }
        },
      ),
    );
  }
}

// class TeamCard extends StatelessWidget {
//   final String teamName;

//   const TeamCard({
//     Key? key,
//     required this.teamName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration:
//           BoxDecoration(image: DecorationImage(image: NetworkImage(imgUrl))),
//       color: const Color.fromRGBO(24, 25, 40, 1),
//       margin: const EdgeInsets.all(10),
//       child: Align(
//         alignment: Alignment.bottomLeft,
//         child: Text(
//           teamName,
//           style: const TextStyle(fontSize: 20, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// class TopScorerCard extends StatelessWidget {
//   final String playerName;
//   final int goalsScored;

//   const TopScorerCard({
//     Key? key,
//     required this.playerName,
//     required this.goalsScored,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: const Icon(Icons.sports_soccer),
//       title: Text(playerName),
//       subtitle: Text('$goalsScored goals'),
//     );
//   }
// }
