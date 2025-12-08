import 'package:flutter/material.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class AppBarZekr extends StatelessWidget implements PreferredSizeWidget {
  const AppBarZekr({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: isDark ? Color(0xff222222) : Color(0xfff5f5f5),
      iconTheme: IconThemeData(
        size: 27,
        color: isDark ? Colors.white : Colors.teal.shade700,
      ),
      shadowColor: AppColors.kIconColor,
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
        child: const CustomText(
          "أذكر اللّٰه",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
