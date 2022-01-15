import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imgUrl;
  final bool visualized;

  const ProfileImage({required this.imgUrl, this.visualized = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: ColorPattern.blueLight,
      child: CircleAvatar(
        radius: visualized ? 20 : 18,
        backgroundImage: CachedNetworkImageProvider(imgUrl),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
