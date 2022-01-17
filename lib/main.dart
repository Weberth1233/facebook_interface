import 'package:facebook_interface/screens/home.dart';
import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Facebook',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: ColorPattern.scaffold),
    home: const Home(),
  ));
}
