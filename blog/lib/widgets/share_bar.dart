import 'package:blog/utils/colors.dart';
import 'package:blog/utils/strings.dart';
import 'package:flutter/material.dart';

class ShareBar extends StatelessWidget {
  const ShareBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 8),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Share with your friends!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                buildSocialButton(height: 60, width: 60, assetPath: whatsapp),
                const SizedBox(width: 6),
                buildSocialButton(height: 24, width: 24, assetPath: facebook),
                const SizedBox(width: 6),
                buildSocialButton(height: 24, width: 24, assetPath: insta),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: -16,
        left: -16,
        child: Opacity(
          opacity: 0.2,
          child: Container(
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(50)),
            height: 70,
            width: 70,
          ),
        ),
      ),
      Positioned(
        bottom: -40,
        left: 12,
        child: Opacity(
          opacity: 0.2,
          child: Container(
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(50)),
            height: 70,
            width: 70,
          ),
        ),
      ),
    ]);
  }

  Widget buildSocialButton({required double height, required double width, required String assetPath}) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
