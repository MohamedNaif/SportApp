import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/data/cubit/Playerscubit/players_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Players extends StatelessWidget {
  const Players({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          // color: Color.fromARGB(255, 117, 94, 93),
          width: MediaQuery.of(context).size.width * 0.5,
          child: BlocBuilder<PlayersCubit, PlayersState>(
            builder: (context, state) {
              if ( state is PlayersSucceed){
              return ListView.builder(
                itemCount: state.playerData.result!.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.read<PlayersCubit>().getPlayersData("${state.playerData.result![index].teamKey!}", "${state.playerData.result![index].playerKey}") ;
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 300,
                    // color: Colors.yellow,
                    decoration: BoxDecoration( image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(state.playerData.result![index].playerImage ?? "https://images.unsplash.com/photo-1568535904307-f48b760a39f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVkJTIwdGV4dHVyZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"))),
                  ),
                ),
              );}
              else if ( state is Playersloading){
                return Center( child : CircularProgressIndicator()) ;
              }else { 
                return Center( child : Text("Error")) ;
              }
            },
          )),
    ));
  }
}
