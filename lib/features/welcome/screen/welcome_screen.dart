import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/welcome/widgets/introduction.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF002B28),
            Color(0xFF01433C),
            Color(0xFF036257),
            Color(0xFF048B76),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // gradient: LinearGradient(
        //   colors: [Color(0xFF115E59), Color(0xFF0D9488), Color(0xFF5EEAD4)],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child:
          // Inroduction Screen
          Introduction(),
    );
  }
}
