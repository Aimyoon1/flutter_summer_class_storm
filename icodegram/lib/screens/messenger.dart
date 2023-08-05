import 'package:flutter/material.dart';
import 'package:icodegram/screens/back_btn.dart';
import 'package:icodegram/screens/individual_chat.dart';
import 'package:icodegram/utils/utility.dart';
import 'package:icodegram/widgets/circle_avatar.dart';
import 'package:icodegram/widgets/my_textfield.dart';
import 'package:icodegram/widgets/rubik_text.dart';
import 'package:icodegram/widgets/rubik_text_gradient.dart';

class MessengerScreen extends StatefulWidget {
  final String userImg;
  const MessengerScreen({super.key, required this.userImg});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  TextEditingController searchPersonWhoUWannaChat = TextEditingController();
  int currentIdxOfMainChat = 0;

  void setCurrIdxOfMainChat(index) {
    setState(() {
      currentIdxOfMainChat = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // 1
            _topOfMessenger(),

            // 2
            _bodyOfMessenger()
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 20),
        child: BottomNavigationBar(
            onTap: setCurrIdxOfMainChat,
            currentIndex: currentIdxOfMainChat,
            selectedItemColor: Colors.deepOrange.shade400,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.transparent,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.public,
                  ),
                  label: 'Public'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.groups_3_outlined), label: 'Group'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: 'Close')
            ]),
      ),
    );
  }

  Widget _topOfMessenger() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MyBackButton(),
            const RubikText(
              text: 'M E S S A G E S',
              size: 22,
              fontWeight: FontWeight.w500,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
        ),

        //
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: MyTextField(
            controller: searchPersonWhoUWannaChat,
            text: 'Search...',
            borderRadius: 20,
          ),
        ),
      ],
    );
  }

  Widget _chat() {
    Widget chatCenter() {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RubikText(
            text: 'Temi',
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 8,
          ),
          RubikTextWithGradient(text: ' A bad day spent baking is better...'),
        ],
      );
    }

    Widget chatRightSide() {
      return Column(
        children: [
          const RubikText(
            text: '1min ago',
            size: 10,
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            // padding: EdgeInsets.all(5),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: iCodePrimaryLinearGradient,
            ),
            child: const Center(child: RubikText(text: '1')),
          )
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const IndividualChat()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                width: 75,
                height: 75,
                child:
                    const MyCircleAvatar(userImg: 'assets/images/users/0.jpeg'),
              ),
              chatCenter(),
            ],
          ),
          chatRightSide(),
        ],
      ),
    );
  }

  Widget _bodyOfMessenger() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          // const RubikText(
          //   text: 'Chats',
          //   fontWeight: FontWeight.w500,
          //   size: 24,
          // ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _chat(),
                  const SizedBox(
                    height: 20,
                  ),
                  _chat(),
                  const SizedBox(
                    height: 20,
                  ),
                  _chat(),
                  const SizedBox(
                    height: 20,
                  ),
                  _chat(),
                  const SizedBox(
                    height: 20,
                  ),
                  _chat(),
                  const SizedBox(
                    height: 20,
                  ),
                  _chat(),
                  const SizedBox(
                    height: 20,
                  ),
                  _chat(),
                  const SizedBox(
                    height: 20,
                  ),
                  _chat(),
                  const SizedBox(
                    height: 20,
                  ),
                  _chat(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
