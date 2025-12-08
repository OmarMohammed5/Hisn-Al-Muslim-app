import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel pageView({
  required String title,
  required String desc,
  required Widget icon,
  required bool isDark,
}) {
  return PageViewModel(
    // Title
    titleWidget: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: 1,
        child: CustomText(
          title,
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    ),

    // Description
    bodyWidget: Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 900),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, value, child) => Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(22),
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CustomText(
              desc,
              textAlign: TextAlign.center,
              maxLines: 8,
              color: Colors.white,
              fontSize: 18,
              height: 1.7,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),

    // Icon
    image: Padding(
      padding: const EdgeInsets.only(top: 120),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 900),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, value, child) => Opacity(
          opacity: value,
          child: Transform.scale(scale: value, child: child),
        ),
        child: icon,
      ),
    ),
  );
}
