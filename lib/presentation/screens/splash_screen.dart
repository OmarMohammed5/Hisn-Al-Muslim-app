import 'package:flutter/material.dart';
import 'package:hisn_almuslim/presentation/widgets/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return BottomNavBarWidget();
          },
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[850] : Colors.grey[350],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                "assets/images/hisn almuslim.png",
                fit: BoxFit.cover,
                width: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
