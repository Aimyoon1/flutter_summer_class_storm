import 'package:flutter/material.dart';
import 'package:icodegram/widgets/rubik_text.dart';

class PickItemsFromGallery extends StatefulWidget {
  const PickItemsFromGallery({super.key});

  @override
  State<PickItemsFromGallery> createState() => _PickItemsFromGalleryState();
}

class _PickItemsFromGalleryState extends State<PickItemsFromGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _topOfScreen(context: context),
            _chosenPhoto(),
            _galleryPhotos()
          ],
        ),
      ),
    );
  }

  // TOP
  Widget _topOfScreen({context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              // padding: EdgeInsets.all(0),
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.chevron_left_outlined)),
          const RubikText(text: 'Зураг Сонгох'),
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff16A34A),
            ),
            child: const Center(
              child: Icon(
                Icons.done,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _chosenPhoto() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8, bottom: 5),
      height: 370,
      color: Colors.deepPurple[300],
      // decoration: BoxDecoration(image: ),
    );
  }

  Widget _galleryPhotos() {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 2, mainAxisSpacing: 2),
          itemCount: 30,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.deepPurple[200],
            );
          }),
    );
  }
}
