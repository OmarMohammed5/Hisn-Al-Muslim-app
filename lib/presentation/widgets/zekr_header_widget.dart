import 'package:flutter/material.dart';
import 'package:hisn_almuslim/theme/app_text.dart';

class ZekrHeaderWidget extends StatelessWidget {
  final int currentIndex;
  final int total;
  final bool isDark;

  const ZekrHeaderWidget({
    super.key,
    required this.currentIndex,
    required this.total,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      color: isDark ? Colors.grey[850] : Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText("الذكر ", fontSize: 16, fontWeight: FontWeight.bold),
          AppText(
            "${currentIndex + 1}",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          AppText(" من ", fontSize: 16, fontWeight: FontWeight.bold),
          AppText("$total", fontSize: 16, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
