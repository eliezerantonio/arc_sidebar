import 'package:flutter/material.dart';
import 'package:flutter_sidebar/components/sidebar_item.dart';
import 'package:flutter_sidebar/flutter_sidebar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _currentScreen = [
    Container(color: Colors.red, width: 500, height: 1000),
    Container(color: Colors.purpleAccent, width: 500, height: 1000),
    Container(color: Colors.orange, width: 500, height: 1000),
    Container(color: Colors.greenAccent, width: 500, height: 1000),
  ];
  void onIconPressed(int index) async {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _currentScreen[_currentIndex],
          FlutterSideBar(
            background: Colors.white,
            header: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Icon(
                    Icons.flutter_dash,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            body: [
              SideBarItem(
                icon: Icons.play_arrow_outlined,
                title: 'Exhibition Screen',
                onTap: () => onIconPressed(0),
              ),
              SideBarItem(
                title: 'Popular Screen',
                icon: Icons.movie_outlined,
                onTap: () => onIconPressed(1),
              ),
              SideBarItem(
                title: 'Briefly Screen',
                icon: Icons.card_giftcard,
                onTap: () => onIconPressed(2),
              ),
            ],
            footer: Column(
              children: [
                ListTile(
                  title: Text("Dark Mode", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17)),
                  leading: Icon(Icons.lightbulb_outline, size: 30),
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
