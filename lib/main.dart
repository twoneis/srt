import 'package:flutter/material.dart';
import 'package:srt/pages/tank.dart';
import 'package:srt/pages/damage.dart';
import 'package:srt/pages/support.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  void initState() {}

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  List<Widget> _pages = [Tank(), Damage(), Support()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Container(), title: Text("Tank")),
            BottomNavigationBarItem(icon: Container(), title: Text("Damage")),
            BottomNavigationBarItem(icon: Container(), title: Text("Support"))
          ]),
    );
  }
}
