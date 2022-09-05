import 'dart:ui';

import 'package:animax/screens/home.dart';
import 'package:animax/screens/profile.dart';
import 'package:animax/widgets/icons/data.dart';
import 'package:animax/widgets/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabItem {
  final String routePath;
  final SystemUiOverlayStyle overlayStyle;
  final Widget screenWidget;

  TabItem({
    required this.screenWidget,
    required this.routePath,
    required this.overlayStyle,
  });
}

final List<TabItem> tabs = [
  TabItem(
    screenWidget: const Home(),
    routePath: Home.routePath,
    overlayStyle: SystemUiOverlayStyle.light,
  ),
  TabItem(
    screenWidget: const Profile(),
    routePath: Profile.routePath,
    overlayStyle: SystemUiOverlayStyle.dark,
  ),
];

class TabBox extends StatefulWidget {
  const TabBox({Key? key, required this.screen}) : super(key: key);

  final String screen;

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int _navCurrentIndex = 0;
  Widget _screen = Container();

  @override
  void initState() {
    super.initState();
    final index =
        tabs.indexWhere((element) => element.routePath == '/${widget.screen}');

    setState(() {
      _screen = tabs[index].screenWidget;
      _navCurrentIndex = index;
    });
  }

  void onTapNavItem(int index) {
    setState(() {
      _navCurrentIndex = index;
      final tabItem = tabs[index];
      _screen = tabItem.screenWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: tabs[_navCurrentIndex].overlayStyle,
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              reverseDuration: const Duration(milliseconds: 0),
              child: _screen,
            ),
            NavigationBar(
              currentIndex: _navCurrentIndex,
              onTapNavItem: onTapNavItem,
            )
          ],
        ),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar(
      {Key? key, required this.currentIndex, required this.onTapNavItem})
      : super(key: key);

  final int currentIndex;
  final void Function(int index) onTapNavItem;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Opacity(
            opacity: 0.8,
            child: BottomNavigationBar(
                onTap: onTapNavItem,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: const Color(0xff9e9e9e),
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: AnimeIcon(AnimeIcons.home),
                      activeIcon: AnimeIcon(AnimeIcons.homeBold),
                      label: 'Home'),
                  BottomNavigationBarItem(
                    icon: AnimeIcon(AnimeIcons.profile),
                    activeIcon: AnimeIcon(AnimeIcons.profileBold),
                    label: 'Profile',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
