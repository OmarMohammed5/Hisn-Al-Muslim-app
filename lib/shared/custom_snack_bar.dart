import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

SnackBar customSnackBar(msg, Color color, IconData icon) {
  return SnackBar(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
    elevation: 0,
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    clipBehavior: Clip.none,
    content: Row(
      spacing: 12,
      children: [
        Icon(icon, color: Colors.white),
        CustomText(
          msg,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ],
    ),
  );
}
