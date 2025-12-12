import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/features/welcome/screen/welcome_screen.dart';
import 'package:hisn_almuslim/root.dart';
import 'package:hisn_almuslim/shared/app_logo.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, required this.seenWelcomeScreen});

  final bool seenWelcomeScreen;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _textFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (widget.seenWelcomeScreen) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Root()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    ///  Light & Dark Gradients
    final lightGradient = const LinearGradient(
      colors: [Color(0xFFE6F5EC), Color(0xFFD9F1E5), Color(0xFFC3EADF)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final darkGradient = LinearGradient(
      colors: [
        Colors.teal.shade900,
        Colors.teal.shade800,
        Colors.teal.shade700,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: isDark ? darkGradient : lightGradient,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///  Glow Light / Dark
            // AnimatedBuilder(
            //   animation: _controller,
            //   builder: (context, child) {
            //     return Container(
            //       height: 150,
            //       width: 150,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: isDark
            //             ? Colors.green.shade400.withValues(
            //                 alpha: 0.10 * _fadeAnimation.value,
            //               )
            //             : Colors.white.withValues(
            //                 alpha: 0.35 * _fadeAnimation.value,
            //               ),
            //         boxShadow: [
            //           BoxShadow(
            //             color: isDark
            //                 ? Colors.greenAccent.withValues(
            //                     alpha: 0.09 * _fadeAnimation.value,
            //                   )
            //                 : Colors.green.shade200.withValues(
            //                     alpha: 0.18 * _fadeAnimation.value,
            //                   ),
            //             blurRadius: 30,
            //             spreadRadius: 12,
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),

            /// App Logo Animation
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: const AppLogo(),
              ),
            ),

            const Gap(40),

            /// Title
            FadeTransition(
              opacity: _textFadeAnimation,
              child: SlideTransition(
                position: _textSlideAnimation,
                child: Text(
                  "حصن المسلم",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                    letterSpacing: 1,
                    color: isDark ? Colors.white : Colors.green.shade900,
                  ),
                ),
              ),
            ),

            const Gap(10),

            /// Subtitle
            FadeTransition(
              opacity: _textFadeAnimation,
              child: Text(
                "أذكارك… زاد يومك",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.green.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
