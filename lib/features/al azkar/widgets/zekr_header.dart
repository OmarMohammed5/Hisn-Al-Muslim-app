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
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Colors.black38 : Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
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
