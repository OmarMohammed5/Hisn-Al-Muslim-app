import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final double maxLines;
  final TextAlign? textAlign;
  final double? height;

  const AppText(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.maxLines = 1,
    this.textAlign,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: TextDirection.rtl,
      text,
      maxLines: maxLines.toInt(),
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Cairo",
        color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
      ),
    );
  }
}
