import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:hisn_almuslim/core/service/notification_service.dart';
import 'package:hisn_almuslim/main.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());

  // Load the state using  SharedPreferences
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final morning = prefs.getBool("enableMorning") ?? false;
    final evening = prefs.getBool("enableEvening") ?? false;
    final zekr = prefs.getBool("enableZekr") ?? false;

    emit(
      state.copyWith(
        enableEvening: evening,
        enableMorning: morning,
        enableZekr: zekr,
      ),
    );
  }

  //// Toggle Notifications of Morning
  Future<void> toggleMorning(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('enableMorning', value);

    emit(state.copyWith(enableMorning: value));

    if (value) {
      await NotificationService.service.scheduleMorning();
    } else {
      // await AndroidAlarmManager.cancel(1);
      await NotificationService.service.cancel(1);
    }
  }

  /// Toggle Notifications of Evening
  Future<void> toggleEvening(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("enableEvening", value);
    emit(state.copyWith(enableEvening: value));

    if (value) {
      await NotificationService.service.scheduleEvening();
    } else {
      // await AndroidAlarmManager.cancel(2);
      await NotificationService.service.cancel(2);
    }
  }

  // Toggle Notifications of 30 min
  Future<void> toggleZekr(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("enableZekr", value);
    emit(state.copyWith(enableZekr: value));

    if (value) {
      // await NotificationService.service.showZekrNotificationCallback();
      await AndroidAlarmManager.periodic(
        const Duration(minutes: 30),
        3,
        callback,
        wakeup: true,
        rescheduleOnReboot: true,
      );
    } else {
      await AndroidAlarmManager.cancel(3);
      await NotificationService.service.cancel(3);
    }
  }
}
