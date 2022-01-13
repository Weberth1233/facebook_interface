import 'package:facebook_interface/models/models.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool visualized;

  Story({required this.user, required this.imageUrl, this.visualized = false});
}
