import 'package:flutter/material.dart';

class CommonShakeWidget extends StatefulWidget {
  const CommonShakeWidget({
    super.key,
    required this.child,
    this.controller,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
  });
  final Widget child;
  final Duration duration;
  final double deltaX;
  final Curve curve;
  final Function(AnimationController)? controller;

  @override
  State<CommonShakeWidget> createState() => _CommonShakeWidgetState();
}

class _CommonShakeWidgetState extends State<CommonShakeWidget>
    with SingleTickerProviderStateMixin<CommonShakeWidget> {
  late AnimationController controller;
  late Animation<double> offsetAnimation;

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    offsetAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: widget.curve))
        .animate(controller);
    if (widget.controller is Function) {
      widget.controller!(controller);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.5 - (0.5 - widget.curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: offsetAnimation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(widget.deltaX * shake(offsetAnimation.value), 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}