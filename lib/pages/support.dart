import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Support"),
        centerTitle: true,
      ),
    );
  }
}