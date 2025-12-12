import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/models/category_model.dart';
import 'package:hisn_almuslim/features/home/widgets/shimmer_skeleton.dart';
import 'package:hisn_almuslim/shared/app_bar_widget.dart';
import 'package:hisn_almuslim/features/home/widgets/banners_widget.dart';
import 'package:hisn_almuslim/features/home/widgets/custom_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Load Home Categories instance of using setState
  Future<bool> loadHomeData() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "اَلأذْكَار اَليَومِيّة"),
      body: FutureBuilder(
        future: loadHomeData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerSkeleton();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Gap(10),
                BannersWidget(),
                Gap(5),

                /// Card View
                GridView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: categories.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 5.8 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CustomCardWidget(
                      title: category.title,
                      icon: category.icon,
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return category.screen;
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
