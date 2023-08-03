import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomMakeIconAnimate extends StatefulWidget {
  final Widget child;
  final bool isIconAnimate;
  final Duration duration;
  final VoidCallback? onEnd;

  const CustomMakeIconAnimate(
      {Key? key,
      this.onEnd,
      required this.child,
      required this.isIconAnimate,
      this.duration = const Duration(milliseconds: 150)})
      : super(key: key);

  @override
  State<CustomMakeIconAnimate> createState() => _CustomMakeIconAnimateState();
}

class _CustomMakeIconAnimateState extends State<CustomMakeIconAnimate>
    with SingleTickerProviderStateMixin {
  // O U R ~ D I C T A T O R 😎
  late AnimationController controller;

  late Animation<double> scale;

  // Initial state ~ This function is called when this object( O U R W I D G E T ) is inserted into the tree
  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      print('init');
    }

    // Animation Controller linearly produces values that range from 0.0 to 1.0, during a given duration. ( Animation<double> valueProduced = controller.value)
    controller = AnimationController(vsync: this, duration: widget.duration);

    // but we no need 0 -> 1 in this case, So interpolate it
    scale = Tween<double>(begin: 1, end: 1.3).animate(controller);
  }

  // Dispose ~ This function is called when the Created object ( O U R W I D G E T ) from the stateful widget is removed permanently from the widget tree.
  @override
  void dispose() {
    if (kDebugMode) {
      print('dispose');
    }
    // Remove animation
    controller.dispose();

    // Remove CustomMakeIconAnimate Widget from Widget3
    super.dispose();
  }

  // DidUpdateWidget ~ Called whenever the widget configuration ( constructer's parameters -> such as child, isIconAnimate... ) changes.
  @override
  void didUpdateWidget(covariant CustomMakeIconAnimate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (kDebugMode) {
      print('didUpdateWidget');
    }

    if (widget.isIconAnimate != oldWidget.isIconAnimate) {
      doAnimation();
    }
  }

  Future doAnimation() async {
    // Start Animation 1 -> 1.2 (widget.duration)
    await controller.forward();

    await Future.delayed(
      const Duration(milliseconds: 100),
    );

    // Reverse Animation 1.2 -> 1 (widget.duration)
    await controller.reverse();

    // Future.delayed( a, b) -> b function  runs after delay.
    await Future.delayed(
      const Duration(milliseconds: 150),
    );
    widget.onEnd!();
  }

  @override
  Widget build(BuildContext context) =>
      ScaleTransition(scale: scale, child: widget.child);
}
