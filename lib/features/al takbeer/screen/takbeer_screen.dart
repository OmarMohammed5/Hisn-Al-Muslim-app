import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/al%20takbeer/widgets/content_of_takbeer.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class TakbeerScreen extends StatelessWidget {
  const TakbeerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kIconColor,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: AppText(
          " اللّٰه أكبر",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(child: ContentOfTakbeer(isDark: isDark)),
      ),
    );
  }
}
