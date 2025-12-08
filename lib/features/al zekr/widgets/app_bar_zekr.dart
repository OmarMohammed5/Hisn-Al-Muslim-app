import 'package:flutter/material.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class AppBarZekr extends StatelessWidget implements PreferredSizeWidget {
  const AppBarZekr({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal.shade800,
      shadowColor: AppColors.kIconColor,
      iconTheme: const IconThemeData(color: Colors.white, size: 25),
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: const CustomText(
        "أذكر اللّٰه",
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
