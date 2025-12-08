import 'package:flutter/material.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.icon,
    required this.title,
    this.trailing,
    this.subTitle,
  });
  final IconData? icon;
  final String title;
  final Widget? trailing;
  final Widget? subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 27, color: AppColors.kIconColor),
      title: CustomText(title, fontSize: 16, fontWeight: FontWeight.w600),
      trailing: trailing,
      subtitle: subTitle,
    );
  }
}
