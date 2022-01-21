import 'package:facebook_interface/components/profile_img.dart';
import 'package:facebook_interface/models/models.dart';
import 'package:flutter/material.dart';

class ProfileImgButton extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const ProfileImgButton({required this.user, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileImage(
            imgUrl: user.imageUrl,
            visualized: true,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            user.name,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
