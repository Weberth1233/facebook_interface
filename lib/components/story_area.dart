import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/profile_img.dart';
import 'package:facebook_interface/data/datas.dart';
import 'package:facebook_interface/models/models.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
          itemCount: 1 +
              storys.length, //Add o campo para adc o story do usuario logado
          itemBuilder: (context, value) {
            if (value == 0) {
              Story storyUser = Story(user: onUser, imageUrl: onUser.imageUrl);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: StoryCard(
                  story: storyUser,
                  addStory: true,
                ),
              );
            }

            Story story = storys[value - 1];
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
  final bool addStory;

  const StoryCard({required this.story, this.addStory = false, Key? key})
      : super(key: key);

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
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: ColorPattern.linearGradient,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: ColorPattern.blueLight,
                    onPressed: () {},
                  ),
                )
              : ProfileImage(
                  imgUrl: story.user.imageUrl,
                  visualized: story.visualized,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            addStory ? "Criar Story" : story.user.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
