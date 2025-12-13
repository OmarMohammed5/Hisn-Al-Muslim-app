import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/about%20app/screen/about_app_screen.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class AboutAppWidget extends StatelessWidget {
  const AboutAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => AboutAppScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transitionsBuilder: (_, animation, __, child) {
              final tween = Tween(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeOut));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: ListTile(
        title: CustomText(
          "عن التطبيق",
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        leading: Icon(
          Icons.info_outline,
          color: AppColors.kIconColor,
          size: 27,
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
      ),
    );
  }
}
