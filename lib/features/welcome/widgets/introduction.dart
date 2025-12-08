import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/welcome/widgets/page_view.dart';
import 'package:hisn_almuslim/root.dart';
import 'package:hisn_almuslim/shared/app_logo.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const Root()));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IntroductionScreen(
      globalBackgroundColor: Colors.transparent,
      pages: [
        pageView(
          title: "مرحباً بك في حصن المسلم",
          desc: "ابدأ رحلتك الإيمانية مع الأذكار اليومية المأثورة",
          icon: AppLogo(),
          isDark: isDark,
        ),
        pageView(
          title: "اذكر الله",
          desc: "سبّح واستغفر بسهولة عبر عداد مريح وتصميم هادئ",
          icon: Image.asset(
            "assets/images/beads.png",
            fit: BoxFit.cover,
            width: 200,
          ),
          isDark: isDark,
        ),
        pageView(
          title: "ابحث عن الأذكار",
          desc: "اعثر على أي ذكر بسرعة مع نظام بحث منظم وسلس",
          icon: Image.asset(
            "assets/images/magnifier.png",
            fit: BoxFit.cover,
            width: 160,
          ),
          isDark: isDark,
        ),
        pageView(
          title: "إشعارات الأذكار",
          desc: "فعّل التنبيهات لتصلك أذكار الصباح والمساء في أوقاتها",
          icon: Image.asset(
            "assets/images/bell.png",
            fit: BoxFit.cover,
            width: 160,
          ),
          isDark: isDark,
        ),
      ],

      showSkipButton: true,
      showBackButton: true,

      skip: _btnText("تخطي"),
      next: _btnText("التالي"),
      back: _btnText("السابق"),
      done: _btnText("ابدأ الآن"),

      onDone: () => _completeOnboarding(context),

      dotsDecorator: DotsDecorator(
        size: const Size(10, 10),
        activeSize: const Size(28, 10),
        color: Colors.white.withValues(alpha: .4),
        activeColor: Colors.white,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  // Button
  Widget _btnText(String txt) {
    return CustomText(
      txt,
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: Colors.white,
    );
  }
}
