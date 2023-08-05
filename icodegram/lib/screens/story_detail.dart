import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icodegram/widgets/circle_avatar.dart';
import 'package:icodegram/widgets/my_textfield.dart';

class StoryDetailScreen extends StatefulWidget {
  final String userName;

  final String story;
  final String userImg;
  const StoryDetailScreen(
      {super.key,
      required this.story,
      required this.userImg,
      required this.userName});

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  TextEditingController userStoryReplyController = TextEditingController();
  _clickFunc() {
    setState(() {
      if (kDebugMode) {
        print('a');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.story), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_topOfTheStory(), _bottomOfTheStory()],
                ),
              ),
            )));
  }

  // TOP OF THE STORY
  Widget _storyTime() {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20000)),
          height: 5,
          child: AnimatedContainer(
            width: 0,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(200000)),
            duration: const Duration(milliseconds: 2000),

            // height: double.infinity,
          ),
        ))
      ],
    );
  }

  // Personal information
  Widget _personalInformation() {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: MyCircleAvatar(userImg: widget.userImg),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.userName,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }

  Widget _topOfTheStory() {
    return Column(
      children: [
        _storyTime(),
        const SizedBox(
          height: 10,
        ),
        _personalInformation()
      ],
    );
  }

  // BOTTOM OF THE STORY
  Widget _bottomOfTheStory() {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: MyTextField(
            controller: userStoryReplyController,
            enabledBorderColor: Colors.transparent,
            focusedBorderColor: Colors.black,
            text: 'Reply to ${widget.userName}',
            fillColor: Colors.white.withOpacity(0.2),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
            width: 30,
            child: Center(
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    _clickFunc();
                  },
                  icon: const Icon(Icons.favorite_border_sharp)),
            )),
      ],
    );
  }
}
