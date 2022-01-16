import 'package:facebook_interface/models/models.dart';

class Post {
  final User user;
  final String description;
  final String timeAgo;
  final String imgUrl;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.user,
    required this.description,
    required this.timeAgo,
    required this.imgUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
