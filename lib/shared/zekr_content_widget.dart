import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ZekrContentWidget extends StatelessWidget {
  final Map<String, dynamic> zekr;

  const ZekrContentWidget({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade900 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${zekr['text']}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 2,
                fontFamily: "Amiri Quran",
              ),
            ),
            Gap(50),
            if (zekr['fadl'].isNotEmpty)
              Text(
                "الفضل: ${zekr['fadl']}",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Amiri Quran",
                  height: 1.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
