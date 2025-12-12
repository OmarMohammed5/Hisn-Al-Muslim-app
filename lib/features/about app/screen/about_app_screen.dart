import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/shared/app_logo.dart';
import 'package:hisn_almuslim/features/about%20app/widgets/defination_of_app.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: isDark ? Color(0xff141414) : Color(0xfff5f5f5),
        iconTheme: IconThemeData(
          size: 27,
          color: isDark ? Colors.white : Colors.teal.shade700,
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [Colors.teal.shade900, Colors.green.shade900]
                  : [Colors.teal.shade400, Colors.green.shade500],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.4)
                    : Colors.green.shade100,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: CustomText(
            "عن التطبيق",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLogo(), // bigger logo
            const Gap(30),
            CustomText(
              "حصن المسلم",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.kIconColor,
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            DefinationOfApp(isDark: isDark),
          ],
        ),
      ),
    );
  }
}
