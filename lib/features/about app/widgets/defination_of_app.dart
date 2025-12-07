import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class DefinationOfApp extends StatelessWidget {
  const DefinationOfApp({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? Colors.grey[900] : Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AppText(
          "تطبيق حصن المسلم هو رفيقك اليومي للحفاظ على الأذكار، "
          "مع إشعارات صباحية ومسائية لتذكيرك دائمًا بذكر الله تعالى، "
          "ويتيح لك الوصول بسهولة إلى أذكار الصباح والمساء وأذكار النوم وفضائل الدعاء.",
          fontSize: 18,
          textAlign: TextAlign.center,
          maxLines: 30,
          height: 1.8,
        ),
      ),
    );
  }
}
