import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class ZekrHeader extends StatelessWidget {
  final int currentIndex;
  final int total;

  const ZekrHeader({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Color(0xfff0f0f0),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText("الذكر ", fontSize: 16, fontWeight: FontWeight.bold),
          CustomText(
            "${currentIndex + 1}",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const CustomText(" من ", fontSize: 16, fontWeight: FontWeight.bold),
          CustomText("$total", fontSize: 16, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
