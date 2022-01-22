import 'package:facebook_interface/components/profile_img_button.dart';
import 'package:facebook_interface/models/models.dart';
import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OptionsList extends StatelessWidget {
  final User user;

  //List _options[0] - [LineIcons.userFriends, ColorPattern.blueLight, "Amigos"],
  //List item = _options[0];
  //item[0]- LineIcons.userFriends
  //item[1]- ColorPattern.blueLight
  //item[2]- "Amigos"

  final List<List> _options = const [
    [LineIcons.userFriends, ColorPattern.blueLight, "Amigos"],
    [LineIcons.facebookMessenger, ColorPattern.blueLight, 'Mensagens'],
    [LineIcons.flag, Colors.orange, 'Páginas'],
    [LineIcons.users, ColorPattern.blueLight, 'Grupos'],
    [Icons.storefront_outlined, ColorPattern.blueLight, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Assistir'],
    [LineIcons.calendar, Colors.deepPurple, 'Eventos'],
    [LineIcons.chevronCircleDown, Colors.black45, 'Ver mais'],
  ];

  const OptionsList({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          itemCount: 1 + _options.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                //horizontal - linha
                //vertical - coluna
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: ProfileImgButton(user: user, onTap: () {}),
              );
            }
            List item = _options[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Option(
                icon: item[0],
                color: item[1],
                text: item[2],
                onTap: () {},
              ),
            );
          }),
    );
  }
}

class Option extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onTap;

  const Option(
      {required this.icon,
      required this.text,
      required this.color,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 35,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style:
                const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
