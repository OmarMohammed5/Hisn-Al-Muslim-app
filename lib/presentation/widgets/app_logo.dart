import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80),
      child: Container(
        width: 120,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 6, offset: Offset(0, 2)),
          ],
        ),
        child: Image.asset('assets/images/hisn almuslim.png', width: 140),
      ),
    );
  }
}
