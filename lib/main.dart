import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisn_almuslim/core/cubit/cubit/azkar_cubit.dart';
import 'package:hisn_almuslim/core/cubit/cubit/notification_cubit.dart';
import 'package:hisn_almuslim/core/cubit/cubit/theme_cubit.dart';
import 'package:hisn_almuslim/core/service/notification_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hisn_almuslim/features/welcome/screen/welcome_screen.dart';
import 'package:hisn_almuslim/root.dart';
import 'package:hisn_almuslim/theme/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

@pragma('vm:entry-point')
void callback() {
  NotificationService.service.showZekrNotificationCallback();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tzdata.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

  await AndroidAlarmManager.initialize();
  await NotificationService.service.init();

  final prefs = await SharedPreferences.getInstance();
  final seenWelcome = prefs.getBool('seen_onboarding') ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (create) => AzkarCubit()),
        BlocProvider(create: (create) => ThemeCubit()),
        BlocProvider(create: (context) => NotificationCubit()..load()),
      ],
      child: MyApp(seenWelcomeScreen: seenWelcome),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool seenWelcomeScreen;
  const MyApp({super.key, required this.seenWelcomeScreen});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          locale: Locale("ar"),
          supportedLocales: [Locale("ar"), Locale("en")],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },
          home: seenWelcomeScreen ? Root() : WelcomeScreen(),
          // home: WelcomeScreen(),
        );
      },
    );
  }
}
