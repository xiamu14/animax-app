import 'package:animax/widgets/icons/data.dart';
import 'package:animax/widgets/icons/icons.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, this.image, required this.size}) : super(key: key);

  final ImageProvider? image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image != null
            ? CircleAvatar(
                radius: size / 2,
                backgroundImage: image,
              )
            : Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size / 2),
                  color: const Color(0xfff6f6f6),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimeIcon(
                    AnimeIcons.profileBold,
                    color: const Color(0xffeae9ee),
                    size: size / 1.3,
                  ),
                ),
              ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Stack(
            children: [
              const Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: ColoredBox(
                    color: Colors.white,
                    child: SizedBox(
                      width: 12,
                      height: 12,
                    ),
                  ),
                ),
              ),
              AnimeIcon(
                AnimeIcons.editSquareBold,
                color: Theme.of(context).primaryColor,
                size: size / 4,
              )
            ],
          ),
        )
      ],
    );
  }
}
