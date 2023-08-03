import 'package:flutter/material.dart';
import 'package:icodegram/screens/home.dart';
import 'package:icodegram/screens/new_post_or_story.dart';
import 'package:icodegram/screens/profile.dart';

List<Widget> screensAfterLogin = [
  const HomeScreen(),
  const NewPostOrStoryScreen(),
  const ProfileScreen()
];
