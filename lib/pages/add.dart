import 'package:flutter/material.dart';
import 'package:srt/main.dart';

class Add extends StatefulWidget {
  final String role;

  Add({@required this.role});

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController sr;

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
            subtitle: TextField(
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => App()));
        },
      ),
    );
  }
}
