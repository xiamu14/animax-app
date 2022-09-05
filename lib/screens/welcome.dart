import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);

  static String routePath = '/welcome';

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: sw,
            height: sh,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              children: const [
                InfoCard(
                  title: 'Welcome to Animax',
                  introduction:
                      'The best streaming anime app of the century to enteritain you every day',
                ),
                InfoCard(
                  title: 'Welcome to Animax',
                  introduction:
                      'The best streaming anime app of the century to enteritain you every day',
                ),
                InfoCard(
                  title: 'Welcome to Animax',
                  introduction:
                      'The best streaming anime app of the century to enteritain you every day',
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: (sw - 360) / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xff06c149),
                    dotHeight: 12,
                    dotWidth: 12,
                    radius: 12,
                    dotColor: Color(0xffe0e0e0),
                  ), // your preferred effect
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: 360,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xff06c149),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Get Start',
                      style: GoogleFonts.urbanist(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.title,
    required this.introduction,
  }) : super(key: key);

  final String title;
  final String introduction;

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/welcome_background.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: sw,
          height: sh * 0.8,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(24, 26, 0, 0),
              Color(0xff181a20),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: sh * 0.2,
              ),
              Text(
                title,
                style: GoogleFonts.urbanist(
                  textStyle: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  introduction,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    textStyle: const TextStyle(
                      height: 1.4,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
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
