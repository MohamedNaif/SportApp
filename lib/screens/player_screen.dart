import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/screens/players_screen.dart';

import '../data/cubit/Playerscubit/players_cubit.dart';

class PlayerScreen extends StatelessWidget {
  final String teamId;
  PlayerScreen({required this.teamId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(24, 25, 40, 1),
        title: Text('Player Screen'),
        leading: InkWell(
            onTap: () {
              context.read<PlayersCubit>().getPlayersData(teamId, '', '');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Players(),
                  ));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: BlocBuilder<PlayersCubit, PlayersState>(
        builder: (context, state) {
          if (state is PlayersSucceed) {
            return ListView.builder(
                itemCount: state.playerData.result!.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    state.playerData.result![index]
                                            .playerName ??
                                        '',
                                    style: const TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  '#${(state.playerData.result![index].playerNumber ?? '')}',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  (state.playerData.result![index]
                                          .playerCountry ??
                                      ''),
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Times New Roman',
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              // maxRadius: 70.0,
                              // minRadius: 55.0,
                              radius: 60.0,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(
                                (state.playerData.result![index].playerImage ??
                                    'https://img.freepik.com/premium-vector/football-player-abstract-shadow-art_9955-1139.jpg?w=2000'),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MatchPlayed: ${(state.playerData.result![index].playerMatchPlayed ?? '')}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Times New Roman',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Age: ${(state.playerData.result![index].playerAge ?? '')}',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Times New Roman',
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.sports_soccer,
                                      size: 36.0,
                                      color: Colors.blue[700],
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      ' ${(state.playerData.result![index].playerGoals ?? '')}',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.emoji_events,
                                      size: 36.0,
                                      color: Colors.yellow[600],
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      ('${(state.playerData.result![index].playerAssists ?? '')}'),
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.warning_rounded,
                                      size: 36.0,
                                      color: Colors.yellow[800],
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      state.playerData.result![index]
                                              .playerYellowCards ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.cancel_rounded,
                                      size: 36.0,
                                      color: Colors.red[700],
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      state.playerData.result![index]
                                              .playerRedCards ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 32.0),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          } else if (state is Playersloading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
