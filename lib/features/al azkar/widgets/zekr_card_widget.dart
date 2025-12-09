import 'package:flutter/material.dart';

class ZekrCardWidget extends StatelessWidget {
  const ZekrCardWidget({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Logo & Title of Zekr
              Expanded(
                child: Row(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? Colors.grey[900] : Colors.grey[200],
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/decoor.png",
                          fit: BoxFit.cover,
                          width: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Amiri Quran",
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
