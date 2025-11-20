import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/theme/app_text.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      /// In order to Navigate to Azkar page
      onTap: onTap,
      child: Container(
        width: 180,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(title, fontSize: 14, fontWeight: FontWeight.bold),
              Gap(10),
              Row(
                spacing: 4,
                children: [
                  AppText("اذهب إلى", color: Colors.grey, fontSize: 12),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                    size: 12,
                  ),
                ],
              ),
              Gap(10),
              Align(
                alignment: Alignment.bottomLeft,
                child: Icon(icon, color: Colors.teal.shade500, size: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
