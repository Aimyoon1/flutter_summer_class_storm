import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:icodegram/screens/pick_items_from_gallery.dart';
import 'package:icodegram/utils/utility.dart';
import 'package:icodegram/widgets/gradient_icon.dart';
import 'package:icodegram/widgets/my_button.dart';
import 'package:icodegram/widgets/my_textfield.dart';
import 'package:icodegram/widgets/rubik_text.dart';

class NewPostOrStoryScreen extends StatefulWidget {
  const NewPostOrStoryScreen({super.key});

  @override
  State<NewPostOrStoryScreen> createState() => _NewPostOrStoryScreenState();
}

class _NewPostOrStoryScreenState extends State<NewPostOrStoryScreen> {
  TextEditingController descriptionOfPostController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // T O P
            _headerOfScreen(),

            // Body
            _bodyOfScreen(context: context)
          ],
        ),
      ),
    );
  }

  Widget _headerOfScreen() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [RubikText(text: 'Зураг сонгох')],
        ),
        SizedBox(
          height: 63,
        )
      ],
    );
  }

  Widget _dottedBorder({context}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const PickItemsFromGallery()));
      },
      child: DottedBorder(
          strokeWidth: 1,
          color: Colors.orange.shade400,
          dashPattern: const [15, 20],
          borderType: BorderType.RRect,
          radius: const Radius.circular(34),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(34),
            child: const SizedBox(
              width: double.infinity,
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIcon(
                      icon: Icons.add_photo_alternate_outlined,
                      size: 36,
                      gradient: iCodePrimaryLinearGradient),
                  SizedBox(
                    height: 13,
                  ),
                  RubikText(
                    text: 'Зураг оруулах',
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _postBtn() {
    return Column(
      children: [
        MyButton(action: () {}, text: 'Постлох', gradientColor: true),
        const SizedBox(
          height: 39,
        )
      ],
    );
  }

  Widget _descriptionOfPost() {
    return const Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.wrap_text,
              size: 22,
            ),
            SizedBox(
              width: 5,
            ),
            RubikText(text: 'Зургийн тайлбар:')
          ],
        ),
        SizedBox(
          height: 12,
        ),
        MyTextField(
          controller: descriptionOfPostController,
          text: 'Энд бичнэ үү.',
          maxLines: 5,
          borderRadius: 16,
          contentPadding: 20,
        ),
      ],
    );
  }

  Widget _bodyOfScreen({context}) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            // Dotted border
            _dottedBorder(context: context),

            //
            const SizedBox(
              height: 29,
            ),

            // Description of Post
            _descriptionOfPost(),
          ],
        ),

        // Post Button
        _postBtn(),
      ],
    ));
  }
}
