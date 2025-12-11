import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/models/content_item.dart';

class ZekrContent extends StatelessWidget {
  final ContentItem content;

  const ZekrContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
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
              content.text,
              style: const TextStyle(
                fontFamily: "Amiri Quran",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 2,
              ),
            ),
            const Gap(50),
            if (content.fadl.isNotEmpty)
              Text(
                "الفضل: ${content.fadl}",
                maxLines: 60,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                  fontFamily: "Amiri Quran",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
