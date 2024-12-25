import 'dart:async';

import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

import 'components/components.dart';

class FlutterSideBar extends StatefulWidget {
  final List<SideBarItem> body;
  final Color background;
  final Color sideBarIconColor;
  final Widget? header;
  final Widget? footer;

  const FlutterSideBar({
    super.key,
    required this.body,
    required this.background,
    this.header = const SizedBox(),
    this.footer = const SizedBox(),
    this.sideBarIconColor = Colors.black,
  });

  @override
  SidebarState createState() => SidebarState();
}

class SidebarState extends State<FlutterSideBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStramController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  bool isSidebarOpened = true;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStramController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStramController.stream;
    isSidebarOpenedSink = isSidebarOpenedStramController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStramController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return StreamBuilder(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, AsyncSnapshot<bool?> isSiderBarOpenedAsync) {
        late final bool? value;

        if (isSiderBarOpenedAsync.data != null) {
          value = isSiderBarOpenedAsync.data;
        }

        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: value! ? 0 : -screenWidth - 20,
          right: value ? 0 : screenWidth - 47,
          child: Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: screenHeight,
                  curve: Curves.bounceIn,
                  decoration: BoxDecoration(color: widget.background),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.header ?? SizedBox(),
                        ...widget.body.map((item) {
                          return SideBarItem(
                            icon: item.icon,
                            title: item.title,
                            onTap: () {
                              onIconPressed();
                              if (item.onTap != null) {
                                item.onTap!();
                              }
                            },
                          );
                        }),
                        widget.footer ?? SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: onIconPressed,
                  child: ClipPath(
                    clipper: CustomMenuclipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: widget.background,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: widget.sideBarIconColor,
                        size: 27,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
