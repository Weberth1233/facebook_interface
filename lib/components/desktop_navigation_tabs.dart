import 'package:facebook_interface/components/button_circle.dart';
import 'package:facebook_interface/components/profile_img_button.dart';
import 'package:facebook_interface/data/datas.dart';
import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'navigation_tabs.dart';

class DesktopNavigationTabs extends StatelessWidget {
  final List<IconData> icons;
  final int selectedTab;
  //Passando função que vai receber o indice do pagina selecionada
  final Function(int) onTap;

  const DesktopNavigationTabs(
      {required this.icons,
      required this.selectedTab,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 65,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ]),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                "facebook",
                style: TextStyle(
                    color: ColorPattern.blueLight,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                    fontSize: 28),
              ),
            ),
            Expanded(
              child: NavigationTabs(
                icons: icons,
                selectedTab: selectedTab,
                onTap: onTap,
                indicatorDown: true,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProfileImgButton(user: onUser, onTap: () {}),
                  ButtonCircle(
                    icon: LineIcons.facebookMessenger,
                    action: () {},
                    size: 30,
                  ),
                  ButtonCircle(
                    icon: Icons.search,
                    action: () {},
                    size: 30,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
