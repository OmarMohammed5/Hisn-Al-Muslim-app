part of 'notification_cubit.dart';

@immutable
class NotificationState {
  final bool enableMorning;
  final bool enableEvening;
  final bool enableZekr;

  const NotificationState({
    this.enableMorning = false,
    this.enableEvening = false,
    this.enableZekr = false,
  });

  NotificationState copyWith({
    bool? enableMorning,
    bool? enableEvening,
    bool? enableZekr,
  }) {
    return NotificationState(
      enableMorning: enableMorning ?? this.enableMorning,
      enableEvening: enableEvening ?? this.enableEvening,
      enableZekr: enableZekr ?? this.enableZekr,
    );
  }
}
