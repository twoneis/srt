import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:srt/classes/game.dart';

class GameList extends StatefulWidget {
  final List<Game> games;

  GameList({
    @required this.games,
  });

  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.games.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.games.elementAt(index).sr.toString()),
          subtitle: Text(widget.games.elementAt(index).time.toString()),
        );
      },
    );
  }
}
