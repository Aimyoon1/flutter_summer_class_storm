import 'package:flutter/material.dart';
import 'package:icodegram/datas/manage_screens.dart';
import 'package:icodegram/datas/users.dart';

import 'package:icodegram/utils/utility.dart';
import 'package:icodegram/widgets/gradient_icon.dart';

class ScreenAfterLogin extends StatefulWidget {
  const ScreenAfterLogin({super.key});

  @override
  State<ScreenAfterLogin> createState() => _ScreenAfterLoginState();
}

class _ScreenAfterLoginState extends State<ScreenAfterLogin> {
  int idxOfWidget = 0;
  void _setScreen(int tappedIdx) {
    setState(() {
      idxOfWidget = tappedIdx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: screensAfterLogin[idxOfWidget],
      // bottomNavigationBar: idxOfWidget == 1 ? null : _bottomNavigationBar(),
      bottomNavigationBar: _bottomNavigationBar(),
    ));
  }

  Widget _bottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: const BoxDecoration(

          // color: Colors.white10.withOpacity(0.15),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _bottomNavigationBarItems(),
      ),
      // child: ,
    );
  }

  Widget _bottomNavBarItem({icon, index}) {
    return Expanded(
      child: GestureDetector(
          onTap: () {
            _setScreen(index);
          },
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GradientIcon(
                  action: _setScreen,
                  index: index,
                  icon: icon,
                  size: 32.0,
                  gradient: index == idxOfWidget
                      ? iCodePrimaryLinearGradient
                      : const LinearGradient(
                          colors: [Colors.white, Colors.white],
                          begin: Alignment.centerRight),
                ),
                AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: index == idxOfWidget ? 8 : 0,
                    height: 8,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: iCodePrimaryLinearGradient))
              ],
            ),
          )),
    );
  }

  List<Widget> _bottomNavigationBarItems() {
    return List.generate(
        3, (index) => _bottomNavBarItem(icon: iconList[index], index: index));
  }
}
