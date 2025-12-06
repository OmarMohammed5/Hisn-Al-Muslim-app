import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/features/al%20hamd/widgets/content_of_hamd.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class HamdScreen extends StatelessWidget {
  const HamdScreen({super.key});

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
          "الحمد لله",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Gap(30),
              ContentOfHamd(isDark: isDark),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
