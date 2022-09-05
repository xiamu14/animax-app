import 'package:animax/api/anime_api.dart';
import 'package:animax/api/model/anime.dart';
import 'package:animax/widgets/icons/data.dart';
import 'package:animax/widgets/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeadBanner extends StatefulWidget {
  const HomeHeadBanner({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeHeadBanner> createState() => _HomeHeadBannerState();
}

class _HomeHeadBannerState extends State<HomeHeadBanner> {
  Future<Anime>? _futureFetchAnimePopular;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureFetchAnimePopular = AnimeApi.getAnimePopular();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        FutureBuilder<Anime>(
          future: _futureFetchAnimePopular,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return Container(
                width: sw,
                height: sh * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.cover),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
            return Container();
          },
        ),
        FutureBuilder<Anime>(
          future: _futureFetchAnimePopular,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: sw,
                  height: sh * 0.2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(24, 26, 0, 0),
                        Color(0xff181a20),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: sw * 0.6,
                            child: Text(
                              data.name,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: sw * 0.8,
                            child: Text(
                              data.introduction,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.urbanist(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const ButtonPlay(),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Center(
                                    child: Text(
                                      '+ My List',
                                      style: GoogleFonts.urbanist(
                                          textStyle: const TextStyle(
                                        color: Colors.white,
                                      )),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              );
            }
            return Container();
          }),
        ),
      ],
    );
  }
}

class ButtonPlay extends StatelessWidget {
  const ButtonPlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Row(children: [
            const AnimeIcon(
              AnimeIcons.playBold,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'Play',
              style: GoogleFonts.urbanist(
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
