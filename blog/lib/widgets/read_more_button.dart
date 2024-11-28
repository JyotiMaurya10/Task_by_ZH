import 'dart:math';
import 'package:blog/utils/colors.dart';
import 'package:blog/utils/styles.dart';
import 'package:flutter/material.dart';

class ReadMoreButton extends StatefulWidget {
  const ReadMoreButton({super.key});

  @override
  State<ReadMoreButton> createState() => _ReadMoreButtonState();
}

class _ReadMoreButtonState extends State<ReadMoreButton> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
            painter: ReadMoreButtonPainter(animationValue: controller.value),
            child: Container(
                width: 116,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(234, 254, 178, 0),
                      Color.fromARGB(253, 246, 150, 17),
                      Color.fromARGB(255, 246, 119, 33),
                    ],
                    stops: [0.2647, 0.4947, 0.7247],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Read More",
                    style: heading14SemiBoldTextStyle.copyWith(fontWeight: FontWeight.w700, color: highlightColor),
                  ),
                )));
      },
    );
  }
}

class ReadMoreButtonPainter extends CustomPainter {
  final double animationValue;

  ReadMoreButtonPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(120));
    final paint = Paint()
      ..shader = SweepGradient(
        colors: const [
          Color(0xFFFFE0E4),
          Color(0xFFFFE0E4),
          Color(0xFF60298B),
        ],
        stops: const [0.0, 0.6, 1.0],
        startAngle: 0,
        endAngle: 2 * pi,
        transform: GradientRotation(2 * pi * animationValue),
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
