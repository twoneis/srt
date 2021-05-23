import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:srt/classes/game.dart';

class GameList extends StatefulWidget {
  final String role;

  GameList({
    @required this.role,
  });

  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  File jsonFile;
  Directory dir;
  String fileName;
  bool fileExists = false;
  Map<String, Game> fileContent;

  @override
  void initState() {
    super.initState();
    fileName = widget.role + ".json";
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        this.setState(() {
          fileContent = jsonDecode(jsonFile.readAsStringSync());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fileContent.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(fileContent.values.elementAt(index).sr.toString()),
          subtitle: Text(fileContent.values.elementAt(index).time.toString()),
        );
      },
    );
  }
}
