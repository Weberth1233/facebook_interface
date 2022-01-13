import 'package:facebook_interface/components/button_circle.dart';
import 'package:facebook_interface/components/post_area.dart';
import 'package:facebook_interface/components/story_area.dart';
import 'package:facebook_interface/data/datas.dart';
import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          //Colocando o custom appbar maior
          //expandedHeight: 250,
          floating: true,
          centerTitle: false,
          title: const Text(
            "facebook",
            style: TextStyle(
                color: ColorPattern.blueLight,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
                fontSize: 28),
          ),
          actions: [
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
        SliverToBoxAdapter(
          child: PostArea(
            user: onUser,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: StoryArea(
              storys: estorias,
              user: onUser,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.green,
            height: 2000,
          ),
        )
      ],
    ));
  }
}
