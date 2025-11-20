import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/presentation/widgets/app_logo.dart';
import 'package:hisn_almuslim/presentation/widgets/defination_of_app.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/theme/app_text.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // final scHeight = MediaQuery.of(context).size.height;
    // final scWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const AppText(
          "عن التطبيق",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: AppColors.kIconColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(30),
            AppLogo(),
            Gap(30),
            AppText(
              "حصن المسلم",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.kIconColor,
            ),
            Gap(50),
            DefinationOfApp(isDark: isDark),
          ],
        ),
      ),
    );
  }
}
