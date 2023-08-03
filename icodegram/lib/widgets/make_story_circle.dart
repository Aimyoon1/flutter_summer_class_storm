import 'package:flutter/material.dart';
import 'package:icodegram/utils/utility.dart';
import 'package:icodegram/widgets/circle_avatar.dart';

class MakeStoryContainer extends StatefulWidget {
  final String userImg;
  final String userName;
  final String userStory;
  final double width, height, marginBottom, marginRight;

  const MakeStoryContainer(
      {super.key,
      required this.width,
      required this.height,
      this.marginBottom = 0,
      this.marginRight = 0,
      required this.userImg,
      required this.userName,
      required this.userStory});

  @override
  State<MakeStoryContainer> createState() => _MakeStoryContainerState();
}

class _MakeStoryContainerState extends State<MakeStoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(2),
        margin: EdgeInsets.only(
            bottom: widget.marginBottom, right: widget.marginRight),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: iCodePrimaryLinearGradient,
        ),
        child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: MyCircleAvatar(userImg: widget.userImg)));
  }
}
