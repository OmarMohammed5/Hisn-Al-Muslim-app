import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        cursorColor: AppColors.kIconColor,
        cursorHeight: 20,
        decoration: InputDecoration(
          enabled: true,
          filled: true,
          fillColor: Color(0xffECEEED),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: AppColors.kIconColor,
            size: 30,
          ),
          hint: AppText(
            "ابحث عن ذكر ....",
            color: AppColors.kIconColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black38),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal.shade900),
          ),
        ),
      ),
    );
  }
}
