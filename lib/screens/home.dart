import 'package:facebook_interface/components/button_circle.dart';
import 'package:facebook_interface/components/contact_list.dart';
import 'package:facebook_interface/components/options_list.dart';
import 'package:facebook_interface/components/post_area.dart';
import 'package:facebook_interface/components/post_card.dart';
import 'package:facebook_interface/utils/resposive.dart';
import 'package:facebook_interface/components/story_area.dart';
import 'package:facebook_interface/data/datas.dart';
import 'package:facebook_interface/models/models.dart';
import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Responsive(
            mobile: HomeMobile(
              scrollController: _scrollController,
            ),
            desktop: HomeDesktop(scrollController: _scrollController)),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobile({required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: scrollController,
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
        SliverList(
          delegate: SliverChildBuilderDelegate((context, value) {
            Post post = postagens[value];
            return PostCard(post: post);
          }, childCount: postagens.length),
        )
      ],
    ));
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeDesktop({required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: OptionsList(
            user: onUser,
          ),
        ),
        const Spacer(),
        Flexible(
            flex: 5,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
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
                  child: PostArea(
                    user: onUser,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, value) {
                    Post post = postagens[value];
                    return PostCard(post: post);
                  }, childCount: postagens.length),
                )
              ],
            )),
        const Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ContactList(users: usuariosOnline),
            ))
      ],
    );
  }
}
