import 'package:flutter/material.dart';
import 'package:icodegram/screens/back_btn.dart';

import 'package:icodegram/widgets/circle_avatar.dart';
import 'package:icodegram/widgets/rubik_text.dart';

class IndividualChat extends StatefulWidget {
  const IndividualChat({super.key});

  @override
  State<IndividualChat> createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [_topOfTheIndividualChat(), _chatEachOther()],
      )),
    );
  }

  Widget _topOfTheIndividualChat() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Back button
            const MyBackButton(),

            const SizedBox(
              width: 30,
            ),

            // Profile picture
            Container(
              margin: const EdgeInsets.only(right: 16),
              width: 40,
              height: 40,
              child:
                  const MyCircleAvatar(userImg: 'assets/images/users/0.jpeg'),
            ),

            // Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RubikText(
                  text: 'Temi Da Silva',
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
                RubikText(
                  size: 12,
                  text: 'Last Seen 10.45am',
                  textColor: Colors.white.withOpacity(0.6),
                ),
              ],
            ),
          ],
        ),

        // Voice call and Video call
        const Row(
          children: [
            Icon(
              Icons.videocam_outlined,
              size: 28,
            ),
            SizedBox(
              width: 24,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.call,
                size: 28,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _chatBubble() {
    return Container(
      width: 20,
      height: 300,
      color: Colors.blue,
    );
  }

  Widget _chatEachOther() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _chatBubble(),
              const SizedBox(
                height: 10,
              ),
              _chatBubble(),
              const SizedBox(
                height: 10,
              ),
              _chatBubble(),
              const SizedBox(
                height: 10,
              ),
              _chatBubble(),
              const SizedBox(
                height: 10,
              ),
              _chatBubble(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
