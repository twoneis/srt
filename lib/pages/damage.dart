import 'package:flutter/material.dart';
import 'package:srt/pages/add.dart';

class Damage extends StatefulWidget {
  @override
  _DamageState createState() => _DamageState();
}

class _DamageState extends State<Damage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Damage"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Add(
                        role: "damage",
                      )));
        },
      ),
    );
  }
}
