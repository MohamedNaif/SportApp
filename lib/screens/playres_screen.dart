// Team model class
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// Player model class
class Player {
  final String name;
  final String position;
  final String imageUrl;

  Player({required this.name, required this.position, required this.imageUrl});
}

// Team model class
class Team {
  final String name;
  final List<Player> players;

  Team({required this.name, required this.players});
}

// PlayerDetailsDialog widget
class PlayerDetailsDialog extends StatelessWidget {
  final Player player;

  PlayerDetailsDialog({required this.player});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(player.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(player.imageUrl),
          SizedBox(height: 10),
          Text('Position: ${player.position}'),
        ],
      ),
    );
  }
}

// PlayerScreen widget
class PlayerScreen extends StatefulWidget {
  final Team team;

  PlayerScreen({required this.team});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  List<Player> _filteredPlayers = [];

  @override
  void initState() {
    super.initState();
    _filteredPlayers = widget.team.players;
  }

  void _filterPlayers(String query) {
    setState(() {
      _filteredPlayers = widget.team.players
          .where((player) =>
              player.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: PlayerSearchDelegate(_filterPlayers),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _filteredPlayers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return PlayerDetailsDialog(player: _filteredPlayers[index]);
                },
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_filteredPlayers[index].imageUrl),
              ),
              title: Text(_filteredPlayers[index].name),
              subtitle: Text(_filteredPlayers[index].position),
            ),
          );
        },
      ),
    );
  }
}

// PlayerSearchDelegate class
class PlayerSearchDelegate extends SearchDelegate<String> {
  final Function(String) onSearch;

  PlayerSearchDelegate(this.onSearch);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
