import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/data/cubit/Playerscubit/players_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/screens/player_screen.dart';

class Players extends StatelessWidget {
  const Players({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(child: BlocBuilder<PlayersCubit, PlayersState>(
        builder: (context, state) {
          if (state is PlayersSucceed) {
            return ListView.builder(
              itemCount: state.playerData.result!.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerScreen(
                          teamId:
                              '${(state.playerData.result![index].teamKey!)}',
                        ),
                      ));

                  context.read<PlayersCubit>().getPlayersData(
                      "${state.playerData.result![index].teamKey!}",
                      "${state.playerData.result![index].playerKey}");
                },
                child: ListTile(
                  trailing: Icon(Icons.sports_soccer),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(state
                            .playerData.result![index].playerImage ??
                        'https://img.freepik.com/premium-vector/football-player-abstract-shadow-art_9955-1139.jpg?w=2000'),
                  ),
                  title: Text(
                    state.playerData.result![index].playerName ?? "",
                    // player['playerName'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  subtitle: Text(
                    '${(state.playerData.result![index].teamName ?? '')} - ${(state.playerData.result![index].playerGoals ?? '')} Goals',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            );
          } else if (state is Playersloading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error"));
          }
        },
      )),
    ));
  }
}
