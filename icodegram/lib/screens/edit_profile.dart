import 'package:flutter/material.dart';

import 'package:icodegram/utils/utility.dart';
import 'package:icodegram/widgets/circle_avatar.dart';

import 'package:icodegram/widgets/my_gradient_text.dart';
import 'package:icodegram/widgets/my_textfield.dart';
import 'package:icodegram/widgets/rubik_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _header(context: context),
                  _updateProfilePicture(),
                  _fields(),
                ],
              ))),
    );
  }

  Widget _header({context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => previousScreen(context: context),
            icon: const Icon(Icons.chevron_left)),
        const RubikText(text: 'Edit Profile'),
        GestureDetector(
          onTap: () => previousScreen(context: context),
          child: const MyGradientText(
            text: 'Done',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _updateProfilePicture() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 31,
        ),
        SizedBox(
          width: 88,
          height: 88,
          child: MyCircleAvatar(userImg: 'assets/images/users/0.jpeg'),
        ),
        SizedBox(
          height: 25,
        ),
        MyGradientText(
            size: 16,
            text: 'Update Profile Picture',
            fontWeight: FontWeight.w600)
      ],
    );
  }

  Widget _fields() {
    return const Column(
      children: [
        SizedBox(
          height: 31,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: RubikText(
                textAlign: TextAlign.start,
                text: 'Name',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: MyTextField(text: 'Name'),
            )
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: RubikText(
                text: 'Username',
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: MyTextField(text: 'rubydd'),
            )
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: RubikText(
                text: 'Password',
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: MyTextField(text: 'Dulguunu'),
            )
          ],
        ),
      ],
    );
  }

  // Widget _singleField({whatField, fieldLabel}) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         flex: 1,
  //         child: RubikText(text: whatField),
  //       ),
  //       Expanded(
  //         flex: 4,
  //         child: MyTextField(text: fieldLabel),
  //       )
  //     ],
  //   );
  // }
}
