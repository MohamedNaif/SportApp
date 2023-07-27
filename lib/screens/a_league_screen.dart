import 'package:flutter/material.dart';
import 'package:myapp/screens/playres_screen.dart';

class ALeagueScreen extends StatelessWidget {
  final String leagueName;

  const ALeagueScreen({
    Key? key,
    required this.leagueName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 25, 40, 1),
          title: Text('La Liga'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Top Scorers'),
              Tab(text: 'Teams'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Overview screen
            Container(
              color: Colors.white,
              child: Center(
                child: Text('Overview screen'),
              ),
            ),
            // Teams screen
            TeamsScreen(),
            // Top Scorers screen
            TopScorersScreen(),
          ],
        ),
      ),
    );
  }
}

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a team',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                // Add team cards here
                InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: ((context) => PlayerScreen(team: ,

                    //         )),
                    //   ),
                    // );
                    //   },
                    child: TeamCard(teamName: 'Team 1')),
                TeamCard(teamName: 'Team 2'),
                TeamCard(teamName: 'Team 3'),
                TeamCard(teamName: 'Team 4'),
              ],
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
        title: Text('Top Scorers'),
      ),
      body: ListView(
        children: [
          // Add top scorer cards here
          TopScorerCard(playerName: 'Player 1', goalsScored: 20),
          TopScorerCard(playerName: 'Player 2', goalsScored: 18),
          TopScorerCard(playerName: 'Player 3', goalsScored: 15),
          TopScorerCard(playerName: 'Player 4', goalsScored: 12),
        ],
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String teamName;

  const TeamCard({
    Key? key,
    required this.teamName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text(
          teamName,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

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
      leading: Icon(Icons.sports_soccer),
      title: Text(playerName),
      subtitle: Text('$goalsScored goals'),
    );
  }
}
