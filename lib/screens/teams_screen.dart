import 'package:flutter/material.dart';
import 'package:myapp/data/cubit/TeamsCubit/teams_cubit.dart';
import 'package:myapp/screens/playres_screen.dart';
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

class TeamsScreen extends StatelessWidget {
  final int leagueKey;
  const TeamsScreen({required this.leagueKey});

  @override
  Widget build(BuildContext context) {
    TextEditingController? search = TextEditingController(text: "");
    return Scaffold(
      body: Column(
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
                        .getTeams(leagueKey, search.text),
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
                        return Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(24, 25, 40, 1),
                              image: DecorationImage(
                                  image: NetworkImage(state
                                          .teamsData.result![index].teamLogo ??
                                      'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg'))),
                          margin: const EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                state.teamsData.result![index].teamName ?? '',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TopScorersScreen extends StatelessWidget {
  const TopScorersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Scorers'),
      ),
      body: ListView(
        children: [
          // Add top scorer cards here
          const TopScorerCard(playerName: 'Player 1', goalsScored: 20),
          const TopScorerCard(playerName: 'Player 2', goalsScored: 18),
          const TopScorerCard(playerName: 'Player 3', goalsScored: 15),
          const TopScorerCard(playerName: 'Player 4', goalsScored: 12),
        ],
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

class TopScorerCard extends StatelessWidget {
  final String playerName;
  final int goalsScored;

  const TopScorerCard({
    Key? key,
    required this.playerName,
    required this.goalsScored,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.sports_soccer),
      title: Text(playerName),
      subtitle: Text('$goalsScored goals'),
    );
  }
}
