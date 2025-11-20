import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:hisn_almuslim/presentation/screens/evening_azkar_screen.dart';
import 'package:hisn_almuslim/presentation/screens/morning_azkar_screen.dart';
import 'package:hisn_almuslim/presentation/screens/alazkar_screen.dart';
import 'package:hisn_almuslim/presentation/screens/prayer_screen.dart';
import 'package:hisn_almuslim/presentation/screens/sleeping_azkar_screen.dart';
import 'package:hisn_almuslim/presentation/screens/zekr_allah_screen.dart';

class CategoryModel {
  final String title;
  final IconData icon;
  final Widget screen;
  CategoryModel({
    required this.title,
    required this.icon,
    required this.screen,
  });
}

final List<CategoryModel> categories = [
  CategoryModel(
    title: "أذكار الصباح",
    icon: Icons.wb_sunny_outlined,
    screen: MorningAzkarScreen(),
  ),
  CategoryModel(
    title: "أذكار المساء",
    icon: Icons.bedtime_outlined,
    screen: EveningAzkarScreen(),
  ),

  CategoryModel(
    title: "أذكار الأذان",
    icon: FlutterIslamicIcons.mosque,
    screen: PrayerScreen(),
  ),
  CategoryModel(
    title: "أذكار النوم",
    icon: Icons.hotel_outlined,
    screen: SleepingAzkarScreen(),
  ),
  CategoryModel(
    title: "الأذكار",
    icon: FlutterIslamicIcons.prayingPerson,
    screen: AlazkarScreen(),
  ),
  CategoryModel(
    title: "أذكر اللّٰه",
    icon: FlutterIslamicIcons.tasbihHand,
    screen: ZekrAllahScreen(),
  ),
];
