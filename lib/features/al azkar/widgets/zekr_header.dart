import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

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
      color: isDark ? Colors.grey[850] : Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText("الذكر ", fontSize: 16, fontWeight: FontWeight.bold),
          AppText(
            "${currentIndex + 1}",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const AppText(" من ", fontSize: 16, fontWeight: FontWeight.bold),
          AppText("$total", fontSize: 16, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
