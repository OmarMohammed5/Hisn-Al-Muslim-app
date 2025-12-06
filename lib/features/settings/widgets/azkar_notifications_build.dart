import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/cubit/cubit/notification_cubit.dart';
import 'package:hisn_almuslim/presentation/widgets/list_tile_widget.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class AzkarNotificationsBuild extends StatelessWidget {
  const AzkarNotificationsBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: AppText(
              "منبهات الأذكار",
              color: AppColors.kIconColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Gap(15),
        // Morning && Evening Azkar && zekr
        BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            return Column(
              spacing: 15,
              children: [
                ListTileWidget(
                  icon: state.enableMorning
                      ? Icons.notifications_active_outlined
                      : Icons.notifications_off_outlined,
                  title: 'أذكار الصباح',
                  trailing: Switch(
                    value: state.enableMorning,
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.kIconColor,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    onChanged: (value) {
                      context.read<NotificationCubit>().toggleMorning(value);
                      final message = value
                          ? "تم تشغيل أذكار الصباح  🌤️"
                          : "تم إيقاف أذكار الصباح  ⏰";

                      // To display message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: value
                              ? Colors.teal.shade700
                              : Colors.red.shade700,
                          content: AppText(message, color: Colors.white),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                      // print("=========== أذكار الصباح ========== : $value");
                    },
                  ),
                ),
                if (state.enableMorning == true)
                  ListTileWidget(
                    icon: Icons.access_time,
                    title: 'وقت أذكار الصباح',
                    trailing: AppText(
                      "7:00 ص",
                      color: AppColors.kIconColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                ListTileWidget(
                  icon: state.enableEvening
                      ? Icons.notifications_active_outlined
                      : Icons.notifications_off_outlined,
                  title: "أذكار المساء",
                  trailing: Switch(
                    value: state.enableEvening,
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.kIconColor,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    onChanged: (value) {
                      context.read<NotificationCubit>().toggleEvening(value);

                      final message = value
                          ? "تم تشغيل أذكار المساء  🌙"
                          : "تم إيقاف أذكار المساء  ⏰";

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: value
                              ? Colors.teal.shade700
                              : Colors.red.shade700,
                          content: AppText(message, color: Colors.white),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );

                      // print("=========== أذكار المساء ========== : $value");
                    },
                  ),
                ),
                if (state.enableEvening == true)
                  ListTileWidget(
                    icon: Icons.access_time,
                    title: 'وقت أذكار المساء',
                    trailing: AppText(
                      "5:30 م",
                      color: AppColors.kIconColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                // ListTileWidget(
                //   icon: FlutterIslamicIcons.mohammad,
                //   title: "الصلاة على النبي ﷺ",
                //   // subTitle: AppText(
                //   //   " كل 15 دقيقة",
                //   //   color: Colors.teal,
                //   //   fontSize: 12,
                //   //   height: 1.7,
                //   // ),
                //   trailing: Switch(
                //     value: state.enableZekr,
                //     activeThumbColor: Colors.white,
                //     activeTrackColor: AppColors.kIconColor,
                //     inactiveThumbColor: Colors.black,
                //     inactiveTrackColor: Colors.white,
                //     onChanged: (value) {
                //       context.read<NotificationCubit>().toggleZekr(value);
                //       // print(
                //       //   "=========== أذكار الصلاة على النبي ﷺ ========== : $value",
                //       // );
                //       // NotificationService.service.testCallback();
                //     },
                //   ),
                // ),
              ],
            );
          },
        ),
      ],
    );
  }
}
