import 'package:flutter/material.dart';
import 'package:hisn_almuslim/theme/app_text.dart';

class DefinationOfApp extends StatelessWidget {
  const DefinationOfApp({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? Colors.grey[850] : Colors.white,
      margin: const EdgeInsets.all(12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: AppText(
          "تطبيق حصن المسلم يساعدك على المحافظة على الأذكار اليومية "
          "مع إشعارات صباحية ومسائية لتذكيرك دائمًا بذكر الله .",
          fontSize: 17,
          textAlign: TextAlign.center,
          maxLines: 30,
          height: 1.7,
        ),
      ),
    );
  }
}
