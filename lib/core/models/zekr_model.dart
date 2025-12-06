import 'package:flutter/widgets.dart';
import 'package:hisn_almuslim/features/al%20hamd/screen/hamd_screen.dart';
import 'package:hisn_almuslim/features/al%20shahada/screen/shahada_screen.dart';
import 'package:hisn_almuslim/features/al%20takbeer/screen/takbeer_screen.dart';
import 'package:hisn_almuslim/features/al%20tasbeeh/screen/tasbeeh_screen.dart';

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
];
