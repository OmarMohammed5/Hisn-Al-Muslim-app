import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService service = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  /// initialize the notification service
  Future<void> init() async {
    final status = await Permission.ignoreBatteryOptimizations.status;
    if (status.isDenied) {
      await Permission.ignoreBatteryOptimizations.request();
    }
    // initialization >> Location
    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    // Setting of init in (Android && Ios)
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _plugin.initialize(initSettings);

    // Request a notification permisson for Android 13+
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }

    // Request a notification permission for iOS
    await _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> showNow({
    required int id,
    required String title,
    required String body,
  }) async {
    await _plugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'main_channel',
          'Main Notifications',
          channelDescription: 'General notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('yaamsallyallaelnaby'),
        ),
        iOS: const DarwinNotificationDetails(),
      ),
    );
  }

  // ==============================
  // Morning Azkar 7 : 00 am
  // ==============================
  Future<void> scheduleMorning() async {
    await _plugin.zonedSchedule(
      1,
      "أذكار الصباح ☀️",
      "ابدأ يومك بذكر الله 🤍",
      _nextInstanceOfTime(7, 0),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'morning_channel',
          'Morning Azkar',
          channelDescription: 'Daily morning azkar',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),

      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  // ==============================
  //  Evening Azkar 17 : 30 >>> 5 : 30 pm
  // ==============================
  Future<void> scheduleEvening() async {
    await _plugin.zonedSchedule(
      2,
      "أذكار المساء 🌙",
      "اختم يومك بذكر الله 🤍",
      _nextInstanceOfTime(17, 30),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'evening_channel',
          'Evening Azkar',
          channelDescription: 'Daily evening azkar',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  // ==============================
  // 💛 صلِّ على النبي ﷺ كل 15 دقيقة
  // ==============================
  Future<void> showZekrNotification() async {
    await showNow(
      id: 100,
      title: "صلِّ على النبي ﷺ",
      body: "اجعل لسانك رطبًا بالصلاة على النبي ﷺ 🤍",
    );
  }

  //// Method to Calculate the time
  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var target = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (target.isBefore(now)) {
      target = target.add(const Duration(days: 1));
    }
    return target;
  }

  // Zekr all 30 min at hour
  @pragma('vm:entry-point')
  void testCallback() {
    debugPrint("✅ Alarm Triggered!");
  }

  Future<void> showZekrNotificationCallback() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);
    await _plugin.initialize(initSettings);

    const androidDetails = AndroidNotificationDetails(
      'zekr_channel',
      'Zekr Notifications',
      channelDescription: 'Repeated salat on the prophet ﷺ',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('yaamsallyallaelnaby'),
    );

    await _plugin.show(
      3,
      "صلِّ على النبي ﷺ",
      "اجعل لسانك رطبًا بالصلاة على النبي ﷺ 🤍",
      const NotificationDetails(android: androidDetails),
    );

    await AndroidAlarmManager.periodic(
      const Duration(minutes: 30),
      3,
      showZekrNotificationCallback,
      wakeup: true,
      rescheduleOnReboot: true,
    );
  }

  /// Cancel a notifiction
  Future<void> cancel(int id) async {
    await _plugin.cancel(id);
  }

  /// Cancel All Notification
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}
