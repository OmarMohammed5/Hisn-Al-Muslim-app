import 'package:flutter/material.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';

class ZekrAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ZekrAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.kIconColor,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "Cairo",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
