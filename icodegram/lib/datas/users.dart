import 'package:flutter/material.dart';

class ICodeUserStory {
  final String userName;
  final String userImg;
  final String userStoryImg;

  const ICodeUserStory(
      {required this.userName,
      required this.userImg,
      required this.userStoryImg});
}

List<String> userNames = ['Temi', 'Kai', 'Ekawa', 'Sajin', 'Shinji', 'Uguumur'];

List<ICodeUserStory> iCodeUsersStoryData = List.generate(
    userNames.length,
    (index) => ICodeUserStory(
        userName: userNames[index],
        userImg: 'assets/images/users/$index.jpeg',
        userStoryImg: 'assets/images/stories/$index.jpeg'));

List<IconData> iconList = [
  Icons.home,
  // Icons.search,
  Icons.add_box_outlined,
  // Icons.chat_bubble_outline_outlined,
  Icons.person
];

class EditProfileFields {
  final String fieldLabel, whatField;
  const EditProfileFields({required this.fieldLabel, required this.whatField});
}

List<String> whatField = ['Name', 'Username', 'Pronouns', 'Bio'];
List<String> fieldLabel = ['Temi', 'rubydd', 'She/Her', 'CHAD'];

List editProfileFieldDatas = List.generate(
    whatField.length,
    (index) => EditProfileFields(
        fieldLabel: fieldLabel[index], whatField: whatField[index]));
