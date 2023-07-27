import 'package:flutter/material.dart';

import 'a_league_screen.dart';

class LeaguesScreen extends StatelessWidget {
  final String countryName;

  const LeaguesScreen({
    Key? key,
    required this.countryName,
    required List leagues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 25, 40, 1),
        title: Text('Leagues'),
      ),
      body: Container(
        color: const Color.fromRGBO(24, 25, 40, 1),
        child: ListView(
          children: [
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              title: Text('La Liga'),
              subtitle: Text('Spanish football league'),
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ALeagueScreen(
                          leagueName: '',
                        )),
                  ),
                );
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              title: Text('Segunda División'),
              subtitle: Text('Second-tier Spanish football league'),
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ALeagueScreen(
                          leagueName: '',
                        )),
                  ),
                );

                // Navigate to Segunda División screen
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              title: Text('Copa del Rey'),
              subtitle: Text('Spanish football cup competition'),
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ALeagueScreen(
                          leagueName: '',
                        )),
                  ),
                );

                // Navigate to Copa del Rey screen
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              title: Text('La Liga'),
              subtitle: Text('Spanish football league'),
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.arrow_forward),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ALeagueScreen(
                          leagueName: '',
                        )),
                  ),
                );
              },
              // Navigate to La Liga screen
            ),
            // Add more leagues here
          ],
        ),
      ),
    );
  }
}
