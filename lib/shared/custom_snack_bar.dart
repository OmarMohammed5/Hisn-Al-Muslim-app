import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

SnackBar customSnackBar(
  String msg,
  IconData icon,
  BuildContext context, {
  Color? lightColor,
  Color? darkColor,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  final Color bgColor = isDark
      ? (darkColor ?? Colors.grey.shade900)
      : (lightColor ?? Colors.teal.shade700);

  final Color textColor = isDark ? Colors.white : Colors.white;
  final Color iconColor = isDark ? Colors.white : Colors.white;

  return SnackBar(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
    backgroundColor: bgColor,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    content: Row(
      children: [
        Icon(icon, color: iconColor, size: 26),
        const SizedBox(width: 12),
        Expanded(
          child: CustomText(
            msg,
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
