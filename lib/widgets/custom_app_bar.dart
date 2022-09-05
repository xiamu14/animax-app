import 'package:animax/screens/home.dart';
import 'package:animax/widgets/icons/data.dart';
import 'package:animax/widgets/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.iconName,
    this.leadingBack = false,
  }) : super(key: key);

  final String title;
  final AnimeIcons? iconName;
  final bool leadingBack;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Container(
      width: sw,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingBack
              ? GestureDetector(
                  onTap: () {
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    } else {
                      GoRouter.of(context).go(Home.routePath);
                    }
                  },
                  child: const AnimeIcon(AnimeIcons.arrowLeft,
                      color: Color(0xff212121), size: 28),
                )
              : Image.asset(
                  'assets/images/logo.png',
                  width: 27.0,
                  height: 26.0,
                ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.urbanist(
                textStyle: const TextStyle(
                  color: Color(0xff212121),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          iconName != null
              ? AnimeIcon(
                  iconName!,
                  color: const Color(0xff212121),
                  size: 22,
                )
              : Container(),
        ],
      ),
    );
  }
}
