import 'package:flutter/material.dart';
import 'package:srt/main.dart';
import 'package:srt/classes/game.dart';
import 'package:srt/elements/createFile.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class Add extends StatefulWidget {
  final String role;

  Add({@required this.role});

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  Game game = new Game();
  TextEditingController sr = new TextEditingController();
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

  void writeToFile(String key, Game value) {
    Map<String, Game> content = {key: value};
    if (fileExists) {
      Map<String, Game> jsonFileContent =
          jsonDecode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
    } else {
      createFile(content, dir, fileName);
      fileExists = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        children: <Widget>[
          ListTile(
            title: Text(
              "Role",
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: TextFormField(
              enabled: false,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: widget.role.toUpperCase(),
                  hintStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
          ListTile(
            title: Text(
              "SR",
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: TextFormField(
              controller: sr,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          print(sr.text);
          game.sr = int.parse(sr.text);
          game.time = DateTime.now();
          writeToFile(DateTime.now().toString(), game);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => App()));
        },
      ),
    );
  }
}
