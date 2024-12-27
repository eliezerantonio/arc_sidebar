import 'package:arc_sidebar/arc_sidebar.dart';
import 'package:arc_sidebar/components/components.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _currentScreen = [
    Container(color: Colors.red, width: 500, height: 1000),
    Container(color: Colors.purpleAccent, width: 500, height: 1000),
    Container(color: Colors.orange, width: 500, height: 1000),
    Container(color: Colors.greenAccent, width: 500, height: 1000),
  ];
  void onIconPressed(int index) async {
    if (_currentIndex == index) return; //* Prevent reconstruction of the current screen
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
          ArcSideBar(
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
