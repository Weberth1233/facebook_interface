import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/profile_img.dart';
import 'package:facebook_interface/models/models.dart';
import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(post: post),
                Text(post.description),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(
              imageUrl: post.imgUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                PostStatistics(
                  post: post,
                ),
                const Divider(
                  thickness: 1.5,
                ),
                Row(
                  children: [
                    ButtonArea(
                        icon: Icon(LineIcons.thumbsUpAlt,
                            color: Colors.grey[700]),
                        text: "Curtir",
                        ontap: () {}),
                    ButtonArea(
                        icon: Icon(LineIcons.alternateCommentAlt,
                            color: Colors.grey[700]),
                        text: "Comentar",
                        ontap: () {}),
                    ButtonArea(
                        icon: Icon(LineIcons.share, color: Colors.grey[700]),
                        text: "Compartilhar",
                        ontap: () {}),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PostStatistics extends StatelessWidget {
  final Post post;

  const PostStatistics({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: ColorPattern.blueLight,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.thumb_up_alt,
                      size: 10, color: Colors.white),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text("${post.likes}"),
              ],
            ),
          ),
          Text("${post.comments} comentários"),
          const SizedBox(
            width: 4,
          ),
          Text("${post.shares} compartilhamentos"),
        ],
      ),
    );
  }
}

class ButtonArea extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback ontap;

  const ButtonArea(
      {required this.icon, required this.text, required this.ontap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: ontap,
          child: Container(
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(
          imgUrl: post.user.imageUrl,
          visualized: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("${post.timeAgo} - "),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
        const Icon(Icons.more_horiz)
      ],
    );
  }
}
