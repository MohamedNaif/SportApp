import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/data/cubit/Playerscubit/players_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/screens/player_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Players extends StatefulWidget {
  final String teamId;

  Players({super.key, required this.teamId});

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> with TickerProviderStateMixin{
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
    TextEditingController searchPlayer = TextEditingController(text: '');
    return SafeArea(
        child: Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchPlayer,
              decoration: InputDecoration(
                hintText: 'Search for a team',
                suffixIcon: InkWell(
                    onTap: () => context
                        .read<PlayersCubit>()
                        .getPlayersData(widget.teamId, '', searchPlayer.text),
                    child: const Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<PlayersCubit, PlayersState>(
              builder: (context, state) {
                if (state is PlayersSucceed) {
                  return ListView.builder(
                    itemCount: state.playerData.result!.length,
                    itemBuilder: (context, index) => SlideTransition(
                  position: index % 2 == 0 ? Tween<Offset>(begin: Offset(-1, 0) , end: Offset(0,0) ).animate(_slideController)  : Tween<Offset>(begin: Offset(1, 0) , end: Offset(0,0) ).animate(_slideController),
                      child: ListTile(
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
                            "${state.playerData.result![index].playerKey}",
                            '');
                      },
                        trailing: Icon(Icons.sports_soccer),
                        leading: CircleAvatar(
                          child: ClipOval(
                            child: CachedNetworkImage(
                                imageUrl: state.playerData.result![index]
                                        .playerImage ??
                                    'https://img.freepik.com/premium-vector/football-player-abstract-shadow-art_9955-1139.jpg?w=2000',
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/images.png')),
                          ),
                          // backgroundImage:
                    
                          //  NetworkImage(state
                          //         .playerData.result![index].playerImage ??
                          //     'https://img.freepik.com/premium-vector/football-player-abstract-shadow-art_9955-1139.jpg?w=2000'),
                          // onBackgroundImageError: (exception, stackTrace) {
                          //   Image.asset('assets/images.png');
                          // },
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
                  return Center(
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
      )),
    ));
  }
}
