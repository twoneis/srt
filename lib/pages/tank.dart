import 'package:flutter/material.dart';
import 'package:srt/pages/add.dart';

class Tank extends StatefulWidget {
  @override
  _TankState createState() => _TankState();
}

class _TankState extends State<Tank> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Tank"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Add(
                        role: "tank",
                      )));
        },
      ),
    );
  }
}
