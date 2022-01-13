import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/models/models.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:flutter/material.dart';

class StoryArea extends StatelessWidget {
  final User user;
  final List<Story> storys;

  const StoryArea({required this.user, required this.storys, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: storys.length,
          itemBuilder: (context, value) {
            Story story = storys[value];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: StoryCard(story: story),
            );
          }),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({required this.story, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
