import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/welcome/screen/welcome_screen.dart';
import 'package:hisn_almuslim/root.dart';
import 'package:hisn_almuslim/shared/app_logo.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, required this.seenWelcomeScreen});

  final bool seenWelcomeScreen;
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      if (widget.seenWelcomeScreen) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Root();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WelcomeScreen();
            },
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [AppLogo()],
        ),
      ),
    );
  }
}
