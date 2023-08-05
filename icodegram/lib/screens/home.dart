import 'package:flutter/material.dart';
import 'package:icodegram/datas/users.dart';
import 'package:icodegram/screens/messenger.dart';
import 'package:icodegram/screens/story_detail.dart';
import 'package:icodegram/widgets/custom_make_icon_animate.dart';
// import 'package:icodegram/utils/utility.dart';
import 'package:icodegram/widgets/lobster_text.dart';
import 'package:icodegram/widgets/make_story_circle.dart';
import 'package:icodegram/widgets/rubik_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Contains Logo and Stories
            _topOfTheHomeScreen(),

            // Contains Posts
            _post(
                userImg: 'assets/images/users/0.jpeg',
                postImg: 'assets/images/stories/0.jpeg',
                userName: 'Temi',
                feedTime: 'a minute ago',
                feedText: 'On my birthday with Baduchika',
                userStory: 'assets/images/stories/0.jpeg',
                likeCount: 69,
                likeStandFor: 'M',
                commentCount: 2,
                commentStandFor: 'M'),
            _post(
                userImg: 'assets/images/users/Dulguunuu.jpeg',
                postImg: 'assets/images/users/10.jpeg',
                userName: 'Baduchika',
                feedTime: 'a minute ago',
                feedText: 'huurhun gahaitaigaa🥰',
                userStory: 'assets/images/stories/0.jpeg',
                likeCount: 12,
                likeStandFor: 'M',
                commentCount: 112,
                commentStandFor: 'K'),
            _post(
                userImg: 'assets/images/users/Dulguunuu.jpeg',
                postImg: 'assets/images/stories/masarapOnBirthday.png',
                userName: 'Baduchika',
                feedTime: 'a minute ago',
                feedText: 'celebrated her bday 3rd time ',
                userStory: 'assets/images/stories/0.jpeg',
                likeCount: 1,
                likeStandFor: 'M',
                commentCount: 69,
                commentStandFor: 'K'),

            _post(
                userImg: 'assets/images/users/2.jpeg',
                postImg: 'assets/images/stories/2.jpeg',
                userName: 'Aimyon36',
                feedTime: 'a minute ago',
                feedText: '✨ )^o^( ✨',
                userStory: 'assets/images/stories/2.jpeg',
                likeCount: 101,
                likeStandFor: 'M',
                commentCount: 1,
                commentStandFor: 'M'),
          ],
        ),
      )),
      // bottomNavigationBar: BottomNavigationBar(items: items),
    );
  }

  bool isIconAnimate = false;
  bool isLiked = false;

  // Navigate messenger screen
  void _navigateMessengerScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MessengerScreen(
                  userImg: 'assets/images/users/Dulguunuu.jpeg',
                )));
  }

  Widget _appName() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LobsterText(
                text: 'Temichika  ',
                size: 25,
              ),
              GestureDetector(
                onTap: _navigateMessengerScreen,
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Image.asset(
                    'assets/icons/chat.png',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _makeStory({userImg, userName, userStory, context}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StoryDetailScreen(
                      userName: userName,
                      userImg: userImg,
                      story: userStory,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            MakeStoryContainer(
                height: 70,
                marginBottom: 5,
                width: 70,
                userImg: userImg,
                userName: userName,
                userStory: userStory),
            RubikText(
              text: userName,
              size: 12,
              textColor: const Color(0xffF9F9F9),
            )
          ],
        ),
      ),
    );
  }

  Widget _makeStories({context}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: iCodeUsersStoryData
            .map((e) => _makeStory(
                context: context,
                userImg: e.userImg,
                userName: e.userName,
                userStory: e.userStoryImg))
            .toList(),
      ),
    );
  }

  // Widget _addStoryFromStoriesPanel(){
  //   return
  // }

  Widget _topOfTheHomeScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_appName(), _makeStories(context: context)],
      ),
    );
  }

  // Navigate The User Detail not Profile page
  void navigateUserDetailScreen() {}

  Widget _headerOfThePost({userImg, userName, userStory}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onLongPress: () {},
                child: MakeStoryContainer(
                    width: 42,
                    height: 42,
                    marginBottom: 0,
                    marginRight: 10,
                    userImg: userImg,
                    userName: userName,
                    userStory: userStory),
              ),
              RubikText(
                text: userName,
                size: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void _clickOnPostPicThenLikeAble() {
    setState(() {
      isLiked = true;
      isIconAnimate = true;
    });
  }

  void _onEnd() {
    setState(() => isIconAnimate = false);
  }

  Widget _bodyOfThePost({postImg}) {
    return GestureDetector(
      onDoubleTap: _clickOnPostPicThenLikeAble,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(postImg), fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Opacity(
            opacity: isIconAnimate ? 1 : 0,
            child: CustomMakeIconAnimate(
              onEnd: _onEnd,
              isIconAnimate: isIconAnimate,
              duration: const Duration(milliseconds: 150),
              child: const Icon(
                Icons.favorite,
                size: 100,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _postBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomMakeIconAnimate(
              isIconAnimate: isLiked,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border_sharp,
                    color: isLiked ? Colors.red : Colors.white,
                    // fill: Fill(Colors.red),
                    size: 32,
                  )),
            ),
            const SizedBox(
              width: 4,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.pets_sharp),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                ))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border_sharp,
            ))
      ],
    );
  }

  Widget _postText(
      {likeCount,
      likeStandFor,
      userName,
      feedText,
      commentCount,
      commentStandFor}) {
    return Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RubikText(
              text: '$likeCount$likeStandFor likes',
              // size: 17,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                RubikText(
                  text: userName.toString().toLowerCase(),
                  fontWeight: FontWeight.bold,
                  // size: ,
                ),
                const SizedBox(
                  width: 5,
                ),
                RubikText(text: feedText)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            commentCount > 0
                ? RubikText(
                    text: 'View all $commentCount$commentStandFor comments',
                    textColor: Colors.grey,
                  )
                : const SizedBox(),
          ],
        ));
  }

  Widget _post(
      {userImg,
      userName,
      postImg,
      feedText,
      feedTime,
      userStory,
      likeCount,
      likeStandFor,
      commentCount,
      commentStandFor}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _headerOfThePost(
          userImg: userImg, userName: userName, userStory: userStory),
      _bodyOfThePost(postImg: postImg),
      _postBtns(),
      _postText(
          commentCount: commentCount,
          commentStandFor: commentStandFor,
          feedText: feedText,
          likeCount: likeCount,
          likeStandFor: likeStandFor,
          userName: userName),
      const SizedBox(
        height: 40,
      )
    ]);
  }
}
