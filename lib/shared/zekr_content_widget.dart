import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ZekrContentWidget extends StatelessWidget {
  final Map<String, dynamic> zekr;

  const ZekrContentWidget({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
