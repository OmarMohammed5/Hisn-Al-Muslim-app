import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/cubit/cubit/theme_cubit.dart';
import 'package:hisn_almuslim/shared/custom_snack_bar.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class ChangeThemeMode extends StatelessWidget {
  const ChangeThemeMode({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: CustomText(
              "تغيير المظهر",
              color: AppColors.kIconColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Gap(15),

        /// THE LIST TILE
        ListTile(
          title: CustomText(
            isDark ? "الوضع الفاتح" : "الوضع الداكن",
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          leading: Icon(
            isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
            color: AppColors.kIconColor,
            size: 27,
          ),
          trailing: Switch(
            value: isDark,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.kIconColor,
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.white,
            onChanged: (value) {
              /// Change theme
              context.read<ThemeCubit>().toggleTheme();

              /// Message
              final message = value
                  ? "تم تفعيل الوضع الليلي"
                  : "تم تفعيل الوضع الفاتح";

              /// Icon
              final icon = value
                  ? Icons.dark_mode_outlined
                  : Icons.wb_sunny_outlined;

              /// SnackBar with NEW improved system
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  message,
                  icon,
                  context,
                  lightColor: Colors.teal.shade700, // Light Mode color
                  darkColor: Colors.grey.shade800, // Dark Mode color
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
