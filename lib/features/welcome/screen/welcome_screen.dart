import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:hisn_almuslim/root.dart';
import 'package:hisn_almuslim/shared/app_logo.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/app_text.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // Load & Navigate to home screen
  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return Root();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IntroductionScreen(
      pages: [
        // Welcome
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: AppText(
              "مرحباً بك في حصن المسلم",
              color: isDark ? Colors.white : Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppText(
              "تعرف على أذكارك اليومية بطريقة سهلة ومنظمة",
              color: isDark ? Colors.white54 : Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              maxLines: 6,
            ),
          ),
          image: AppLogo(),
        ),

        // Zekr Allah
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: AppText(
              "اذكر الله",
              color: isDark ? Colors.white : Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppText(
              "استخدم العداد لتسبيح واستغفار مريح وبسيط",
              color: isDark ? Colors.white54 : Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              maxLines: 6,
            ),
          ),
          image: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
              child: Icon(
                FlutterIslamicIcons.allah,
                size: 160,
                color: AppColors.kIconColor,
              ),
            ),
          ),
        ),

        // Search about zekr
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: AppText(
              "ابحث عن الأذكار",
              color: isDark ? Colors.white : Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppText(
              "ابحث عن أي ذكر بسهولة داخل التطبيق",
              color: isDark ? Colors.white54 : Colors.black54,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              maxLines: 6,
            ),
          ),
          image: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
              child: Icon(
                CupertinoIcons.search,
                color: AppColors.kIconColor,
                size: 160,
              ),
            ),
          ),
        ),

        // Notification of Azkar
        PageViewModel(
          titleWidget: AppText(
            "إشعارات الأذكار",
            color: isDark ? Colors.white : Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  "فعّل التنبيهات لتصلك أذكار الصباح والمساء في أوقاتها.",
                  color: isDark ? Colors.white54 : Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1.7,
                  maxLines: 30,
                ),
                AppText(
                  "يمكنك تفعيل أو إيقاف الإشعارات من إعدادات التطبيق في أي وقت.",
                  color: isDark ? Colors.white54 : Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1.7,
                  maxLines: 30,
                ),
              ],
            ),
          ),
          image: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
              child: Icon(
                Icons.notifications_active_outlined,
                color: AppColors.kIconColor,
                size: 160,
              ),
            ),
          ),
        ),
      ],

      showSkipButton: true,
      showBackButton: true,
      skip: AppText(
        "تخطي",
        color: AppColors.kIconColor,
        fontWeight: FontWeight.bold,
      ),
      next: AppText(
        "التالي",
        color: AppColors.kIconColor,
        fontWeight: FontWeight.bold,
      ),
      back: AppText(
        "السابق",
        color: AppColors.kIconColor,
        fontWeight: FontWeight.bold,
      ),
      //  Icon(Icons.arrow_forward, color: AppColors.kIconColor, size: 25),
      done: AppText(
        "ابدأ الأن",
        fontWeight: FontWeight.bold,
        color: AppColors.kIconColor,
      ),
      onDone: () => _completeOnboarding(context),
      dotsDecorator: DotsDecorator(
        size: Size(10, 10),
        activeSize: Size(25, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.grey.shade400,
        activeColor: AppColors.kIconColor,
      ),
    );
  }
}
