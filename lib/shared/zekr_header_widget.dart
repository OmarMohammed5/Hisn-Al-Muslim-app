import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

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
      decoration: BoxDecoration(
        color: isDark ? Colors.black38 : Colors.grey.shade300,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText("الذكر ", fontSize: 16, fontWeight: FontWeight.bold),
          CustomText(
            "${currentIndex + 1}",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          CustomText(" من ", fontSize: 16, fontWeight: FontWeight.bold),
          CustomText("$total", fontSize: 16, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
