import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/cubit/cubit/notification_cubit.dart';
import 'package:hisn_almuslim/core/cubit/cubit/theme_cubit.dart';
import 'package:hisn_almuslim/features/settings/widgets/about_app_widget.dart';
import 'package:hisn_almuslim/shared/app_bar_widget.dart';
import 'package:hisn_almuslim/features/settings/widgets/azkar_notifications_build.dart';
import 'package:hisn_almuslim/features/settings/widgets/change_theme_mode.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final isDark = themeCubit.state == ThemeMode.dark;

    return Scaffold(
      appBar: AppBarWidget(title: "اِلإِعْدَادَات"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            // Change the Theme
            ChangeThemeMode(isDark: isDark),

            Gap(20),
            Divider(
              color: isDark ? Colors.white24 : Colors.black26,
              endIndent: 20,
              indent: 20,
            ),
            Gap(20),
            // Azkar Notifications
            AzkarNotificationsBuild(),

            Gap(15),
            Divider(
              color: isDark ? Colors.white24 : Colors.black26,
              endIndent: 20,
              indent: 20,
            ),
            Gap(15),
            // About App
            AboutAppWidget(),

            Gap(50),
          ],
        ),
      ),
    );
  }
}
