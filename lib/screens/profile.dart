import 'package:animax/widgets/avatar.dart';
import 'package:animax/widgets/custom_app_bar.dart';
import 'package:animax/widgets/icons/data.dart';
import 'package:animax/widgets/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

enum ActionType { common, logout, darkMode, language }

class ActionItem {
  final AnimeIcons iconName;
  final String title;
  final ActionType type;

  ActionItem({
    required this.iconName,
    required this.title,
    this.type = ActionType.common,
  });
}

final List<ActionItem> actions = [
  ActionItem(iconName: AnimeIcons.profile, title: 'Edit Profile'),
  ActionItem(iconName: AnimeIcons.notification, title: 'Notification'),
  ActionItem(iconName: AnimeIcons.download, title: 'Download'),
  ActionItem(iconName: AnimeIcons.shieldDone, title: 'Security'),
  ActionItem(iconName: AnimeIcons.infoSquare, title: 'Help Center'),
  ActionItem(iconName: AnimeIcons.infoSquare, title: 'Privacy Policy'),
  ActionItem(
      iconName: AnimeIcons.logout, title: 'Logout', type: ActionType.logout),
];

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  static String routePath = '/tabProfile';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Profile',
            iconName: AnimeIcons.moreCircle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    const Avatar(
                      size: 80,
                      image: AssetImage('assets/images/avatar_0.png'),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Andrew Ainslay',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff212121),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'andrew_ainslay@google.com',
                          style: GoogleFonts.urbanist(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff212121),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Column(
                  children: actions
                      .map((actionItem) => Column(
                            children: [
                              ActionItemWidget(
                                actionItem: actionItem,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ))
                      .toList(),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionItemWidget extends StatelessWidget {
  const ActionItemWidget({Key? key, required this.actionItem})
      : super(key: key);

  final ActionItem actionItem;

  @override
  Widget build(BuildContext context) {
    if (actionItem.type == ActionType.logout) {
      return Row(
        children: [
          AnimeIcon(
            actionItem.iconName,
            size: 20,
            color: const Color(0xfff75555),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              actionItem.title,
              style: GoogleFonts.urbanist(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff75555),
                ),
              ),
            ),
          )
        ],
      );
    }
    return Row(
      children: [
        AnimeIcon(
          actionItem.iconName,
          size: 20,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            actionItem.title,
            style: GoogleFonts.urbanist(
                textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff212121),
            )),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const AnimeIcon(
          AnimeIcons.arrowRight,
          size: 18,
        ),
      ],
    );
  }
}
