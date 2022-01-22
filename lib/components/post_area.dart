import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/text_button_icon.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:facebook_interface/utils/resposive.dart';
import 'package:flutter/material.dart';

class PostArea extends StatelessWidget {
  final User user;

  const PostArea({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: isDesktop ? 5 : 0,
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: CachedNetworkImageProvider(user.imageUrl),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "No que você está pensando"),
                  ))
                ],
              ),
              const Divider(
                height: 10,
                thickness: 0.5,
              ),
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    TextButtonIcon(
                      icon: Icons.videocam,
                      color: Colors.red,
                      text: 'Video',
                    ),
                    //Linha na vertical de cada textbutton
                    VerticalDivider(width: 8),
                    TextButtonIcon(
                      icon: Icons.photo_library,
                      color: Colors.green,
                      text: 'Foto',
                    ),
                    //Linha na vertical de cada textbutton
                    VerticalDivider(width: 8),
                    TextButtonIcon(
                      icon: Icons.video_call,
                      color: Colors.purple,
                      text: 'Sala',
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
