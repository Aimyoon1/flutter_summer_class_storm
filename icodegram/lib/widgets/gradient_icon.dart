import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon({
    super.key,
    this.action,
    this.index,
    required this.icon,
    required this.size,
    required this.gradient,
  });
  final int? index;
  final Function? action;
  final IconData icon;
  final double size;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: IconButton(
        onPressed: () {
          if (action != null && index != null) {
            action!(index);
          } else {
            action!();
          }
        },
        icon: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
