import 'package:flutter/material.dart';

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
    );
  }
}