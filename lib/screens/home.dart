import 'package:animax/widgets/home_head_banner.dart';
import 'package:animax/widgets/icons/data.dart';
import 'package:animax/widgets/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static String routePath = '/tabHome';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: Stack(
                    children: [
                      ListView(
                        children: const [
                          HomeHeadBanner(),
                        ],
                      ),
                      const TopBar(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Container(
      width: sw,
      height: sh * 0.12,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff181a20),
            Color.fromRGBO(24, 26, 0, 0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Align(
        alignment: const Alignment(0, 0.65),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 32,
                height: 32,
              ),
              const Spacer(),
              const AnimeIcon(
                AnimeIcons.search,
                color: Colors.white,
              ),
              const SizedBox(
                width: 12,
              ),
              const AnimeIcon(
                AnimeIcons.notification,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
