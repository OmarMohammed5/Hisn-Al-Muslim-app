import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/cubit/cubit/azkar_cubit.dart';
import 'package:hisn_almuslim/features/al%20azkar/screen/zekr_details_screen.dart';
import 'package:hisn_almuslim/features/al%20azkar/widgets/azkar_app_bar.dart';
import 'package:hisn_almuslim/features/al%20azkar/widgets/zekr_card_widget.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class AlazkarScreen extends StatefulWidget {
  const AlazkarScreen({super.key});

  @override
  State<AlazkarScreen> createState() => _AlazkarScreenState();
}

class _AlazkarScreenState extends State<AlazkarScreen> {
  @override
  void initState() {
    context.read<AzkarCubit>().getAzkar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AzkarAppBar(),
      body: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          if (state is AzkarLoading) {
            return Center(
              child: CupertinoActivityIndicator(
                color: Colors.teal.shade600,
                radius: 16,
              ),
            );
          } else if (state is AzkarLoaded) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 15),
              itemCount: state.zekrList.length,
              itemBuilder: (context, index) {
                final azkar = state.zekrList[index];
                return Column(
                  children: [
                    ZekrCardWidget(
                      title: azkar.title,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ZekrDetailsScreen(
                              zekr: azkar,
                              initialIndex: index,
                            ),
                          ),
                        );
                      },
                    ),

                    Gap(10),
                    Divider(
                      color: isDark ? Colors.white24 : Colors.black26,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                );
              },
            );
          } else if (state is AzkarError) {
            return Center(
              child: CustomText(
                state.errorMessage,
                fontSize: 18,
                color: Colors.red,
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
