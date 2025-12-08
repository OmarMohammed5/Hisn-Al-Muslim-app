import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/cubit/cubit/notification_cubit.dart';
import 'package:hisn_almuslim/features/settings/widgets/list_tile_widget.dart';
import 'package:hisn_almuslim/shared/custom_snack_bar.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

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
            child: CustomText(
              "منبهات الأذكار",
              color: AppColors.kIconColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Gap(15),

        /// Morning + Evening Notifications
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
                          ? "تم تفعيل أذكار الصباح"
                          : "تم إيقاف أذكار الصباح";

                      final icon = value
                          ? Icons.notifications_active_outlined
                          : Icons.notifications_off_outlined;

                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                          message,
                          icon,
                          context,
                          lightColor: value
                              ? Colors.teal.shade700
                              : Colors.red.shade700,
                          darkColor: value
                              ? Colors.teal.shade900
                              : Colors.red.shade900,
                        ),
                      );
                    },
                  ),
                ),

                if (state.enableMorning)
                  ListTileWidget(
                    icon: Icons.access_time,
                    title: 'وقت أذكار الصباح',
                    trailing: CustomText(
                      "5:30 ص",
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
                          ? "تم تفعيل أذكار المساء"
                          : "تم إيقاف أذكار المساء";

                      final icon = value
                          ? Icons.notifications_active_outlined
                          : Icons.notifications_off_outlined;

                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                          message,
                          icon,
                          context,
                          lightColor: value
                              ? Colors.teal.shade700
                              : Colors.red.shade700,
                          darkColor: value
                              ? Colors.teal.shade900
                              : Colors.red.shade900,
                        ),
                      );
                    },
                  ),
                ),

                if (state.enableEvening)
                  ListTileWidget(
                    icon: Icons.access_time,
                    title: 'وقت أذكار المساء',
                    trailing: CustomText(
                      "3:30 م",
                      color: AppColors.kIconColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
