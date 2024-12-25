# arc_sidebar

by:  [Eliezer António](https://github.com/eliezerantonio/)

| ![Imagem 1](https://github.com/eliezerantonio/arc_sidebar/blob/main/assets/img/home.png) | ![Gif Exemplo](https://github.com/eliezerantonio/arc_sidebar/blob/main/assets/gifs/general.gif?raw=true) |
|---------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|

## Installation

Add `arc_sidebar: ^0.0.1` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:arc_sidebar/arc_sidebar.dart';
```

## How to use

```dart
 ArcSideBar(
            body: [
              SideBarItem(
                icon: Icons.play_arrow_outlined,
                title: 'Exhibition Screen',
                onTap: (){

                },
              ),
              SideBarItem(
                title: 'Popular Screen',
                icon: Icons.movie_outlined,
               onTap: (){
                  
                },
              ),
              SideBarItem(
                title: 'Briefly Screen',
                icon: Icons.card_giftcard,
               onTap: (){
                  
                },
              ),
            ],
      
          );
  ```

### All SliderItem parameters

```dart

  Key? key,
  IconData? icon,
  TextStyle? style,
  Color? iconColor,
  String title,
  void Function()? onTap,
  
 ```

## General Example

## Preview

<img src="https://github.com/eliezerantonio/arc_sidebar/blob/main/assets/gifs/example.gif?raw=true" height="400">

```dart

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

  ```  

---

### 🤝 **Contributing to ArcSideBar**

1. **Fork the Repository**: Create your copy.
2. **Create a Branch**:

   ```bash
   git checkout -b my-feature-branch
   ```

3. **Make Changes**: Implement your feature or fix.
4. **Commit Changes**:

   ```bash
   git commit -m "Add a new feature"
   ```

5. **Push to Your Fork**:

   ```bash
   git push origin my-feature-branch
   ```

6. **Create a Pull Request**: Submit your changes for review.
