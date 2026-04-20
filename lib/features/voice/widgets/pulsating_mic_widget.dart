import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PulsatingMicWidget extends StatefulWidget {
  const PulsatingMicWidget({super.key});

  @override
  State<PulsatingMicWidget> createState() => _PulsatingMicWidgetState();
}

class _PulsatingMicWidgetState extends State<PulsatingMicWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.scale(
        scale: 1.0 + (_animation.value * 0.25),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryYellow.withValues(alpha: 0.15),
          ),
          child: const Icon(
            Icons.mic,
            size: 40,
            color: AppColors.primaryYellow,
          ),
        ),
      ),
    );
  }
}
