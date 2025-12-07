import 'package:flutter/widgets.dart';
import 'package:hisn_almuslim/features/al%20zekr/screen/esteghfar_screen.dart';
import 'package:hisn_almuslim/features/al%20zekr/screen/hamd_screen.dart';
import 'package:hisn_almuslim/features/al%20zekr/screen/prayer_for_the_prophet.dart';
import 'package:hisn_almuslim/features/al%20zekr/screen/shahada_screen.dart';
import 'package:hisn_almuslim/features/al%20zekr/screen/takbeer_screen.dart';
import 'package:hisn_almuslim/features/al%20zekr/screen/tasbeeh_screen.dart';

class ZekrModel {
  final String title;
  final Widget screen;
  ZekrModel({required this.title, required this.screen});
}

final List<ZekrModel> zekrList = [
  ZekrModel(title: "سبحان اللّٰه", screen: TasbeehScreen()),
  ZekrModel(title: "الحمد لله", screen: HamdScreen()),
  ZekrModel(title: "لا إله إلا اللّٰه", screen: ShahadaScreen()),
  ZekrModel(title: " اللّٰه أكبر", screen: TakbeerScreen()),
  ZekrModel(title: "صلي على محمد ﷺ", screen: PrayerForTheProphet()),
  ZekrModel(title: "أستغفر اللّٰه", screen: EsteghfarScreen()),
];
