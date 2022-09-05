import 'package:animax/widgets/icons/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimeIcon extends StatelessWidget {
  const AnimeIcon(this.icon, {Key? key, this.color, this.size})
      : super(key: key);

  final AnimeIcons icon;

  final Color? color;

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/${icon.name}.svg',
      color: color ?? IconTheme.of(context).color,
      width: size ?? IconTheme.of(context).size,
      height: size ?? IconTheme.of(context).size,
      alignment: Alignment.center,
    );
  }
}
