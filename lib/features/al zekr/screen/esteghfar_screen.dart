import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_of_esteghfar.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';

class EsteghfarScreen extends StatelessWidget {
  const EsteghfarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kIconColor,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomText(
          "أستغفر اللّٰه",
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ContentOfEsteghfar(isDark: isDark),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
