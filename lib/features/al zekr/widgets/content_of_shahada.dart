import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/constant/app_text.dart';

class ContentOfShahada extends StatelessWidget {
  const ContentOfShahada({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Card(
          color: isDark ? Colors.grey[850] : Colors.white,
          margin: const EdgeInsets.all(12),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppText.shahada,
              style: TextStyle(
                fontSize: 18,
                height: 1.8,
                fontFamily: "Amiri Quran",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
