import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/al%20shahada/widgets/content_of_shahada.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class ShahadaScreen extends StatelessWidget {
  const ShahadaScreen({super.key});

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
          "لا إله إلا اللّٰه",
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(child: ContentOfShahada(isDark: isDark)),
      ),
    );
  }
}
