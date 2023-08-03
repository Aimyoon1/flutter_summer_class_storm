import 'package:flutter/material.dart';
import 'package:icodegram/screens/edit_profile.dart';
import 'package:icodegram/screens/share_profile.dart';

import 'package:icodegram/widgets/make_story_circle.dart';
import 'package:icodegram/widgets/rubik_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              _header(),

              // GAP
              const SizedBox(
                height: 16,
              ),

              //
              _profileFollowersAndEdit(),

              // GAP
              const SizedBox(
                height: 16,
              ),

              //
              _editProfileAndShareProfile(context: context),

              // GAP
              const SizedBox(
                height: 16,
              ),

              // TAB BAR
              _customTabBar(),
              _customTabBarViews()
            ],
          ),
        ),
      ),
    );
  }

  // Including Lock icon if account is private, username, Add icon to post, Bar icon to Logout
  Widget _header() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.lock_outline_rounded,
                size: 22,
              ),
              SizedBox(
                width: 5,
              ),
              RubikText(
                text: 'rubydd',
                fontWeight: FontWeight.bold,
                size: 24,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.add_box_outlined,
                size: 32,
              ),
              SizedBox(
                width: 30,
              ),
              Icon(
                Icons.menu_rounded,
                size: 36,
              )
            ],
          )
        ],
      ),
    );
  }

  // Including Profile picture & post, followers, following number
  Widget _profileFollowersAndEdit() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Picture
          MakeStoryContainer(
              width: 80,
              height: 80,
              userImg: 'assets/images/users/0.jpeg',
              userName: 'Temi',
              userStory: 'assets/images/stories/0.jpeg'),

          // Gap
          SizedBox(
            width: 10,
          ),

          // Followers & Following list, Edit Profile
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                SizedBox(),
                //Post
                Column(
                  children: [
                    RubikText(
                      text: '0',
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    RubikText(
                      text: 'Posts',
                      size: 16,
                    )
                  ],
                ),

                // Followers
                Column(
                  children: [
                    RubikText(
                      text: '510M',
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    RubikText(
                      text: 'Followers',
                      size: 16,
                    )
                  ],
                ),

                // Following
                Column(
                  children: [
                    RubikText(
                      text: '112',
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    RubikText(
                      text: 'Following',
                      size: 16,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _btn({text, flex, context, widget}) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => widget == 'edit'
                      ? const EditProfileScreen()
                      : const ShareProfileScreen()));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: RubikText(
              text: text,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Including Edit profile & Share profile
  Widget _editProfileAndShareProfile({context}) {
    return Row(
      children: [
        _btn(text: 'Edit profile', flex: 4, widget: 'edit', context: context),
        _btn(
            text: 'Share profile',
            flex: 4,
            widget: 'shareProfile',
            context: context),
        Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Icon(
                Icons.person_add_outlined,
                size: 28,
              ))),
        )
      ],
    );
  }

  // 1st TAB BAR VIEW
  Widget _a1stTabIfNoPost() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: Colors.white)),
          child: const Icon(
            Icons.camera_alt_outlined,
            size: 70,
            // weight: medi,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const RubikText(
          text: 'No Post Yet',
          size: 40,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }

  // 2nd TAB BAR VIEW
  Widget _a2ndTabIfNoTaggedPost() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: Colors.white)),
            child: const Icon(
              Icons.spatial_audio_outlined,
              size: 60,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const RubikText(
            text: 'Photos and videos of you',
            size: 24,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 10,
          ),
          RubikText(
            text:
                'When people tag you in photos and videos, they\'ll appear here.',
            textColor: Colors.white.withOpacity(0.6),
            size: 18,
          )
        ],
      ),
    );
  }

  // Posts and Tagged Posts ~ TAB BAR
  Widget _customTabBar() {
    return TabBar(indicatorColor: Colors.orange[700], tabs: const [
      Tab(
        icon: Icon(Icons.grid_on_sharp),
      ),
      Tab(
        icon: Icon(Icons.person_pin_outlined),
      )
    ]);
  }

  Widget _customTabBarViews() {
    return Expanded(
        child: TabBarView(
            children: [_a1stTabIfNoPost(), _a2ndTabIfNoTaggedPost()]));
  }
}
