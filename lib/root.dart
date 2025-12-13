// import 'package:flutter/material.dart';
// import 'package:hisn_almuslim/features/home/screen/home_screen.dart';
// import 'package:hisn_almuslim/features/settings/screen/settings_screen.dart';
// import 'package:hisn_almuslim/theme/app_colors.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// class Root extends StatefulWidget {
//   const Root({super.key});

//   @override
//   State<Root> createState() => _RootState();
// }

// class _RootState extends State<Root> {
//   PersistentTabController _controller = PersistentTabController();

//   List<Widget> _buildScreens() {
//     return [HomeScreen(), SettingsScreen()];
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     return PersistentTabView(
//       padding: EdgeInsets.only(top: 2, bottom: 10),
//       margin: EdgeInsets.only(bottom: 23, left: 40, right: 40),
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: [
//         PersistentBottomNavBarItem(
//           icon: Padding(
//             padding: const EdgeInsets.only(top: 8),
//             child: const Icon(Icons.home, size: 25),
//           ),
//           inactiveIcon: Padding(
//             padding: const EdgeInsets.only(top: 8),
//             child: Icon(Icons.home_outlined, size: 25),
//           ),
//           title: "الرئيسية",
//           textStyle: const TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.w800,
//             fontFamily: "Cairo",
//           ),
//           activeColorPrimary: Color(0xffe7f7ec),
//           inactiveColorPrimary: Colors.grey.shade400,
//         ),

//         PersistentBottomNavBarItem(
//           icon: Padding(
//             padding: const EdgeInsets.only(top: 8),
//             child: Icon(Icons.settings, size: 25),
//           ),
//           inactiveIcon: Padding(
//             padding: const EdgeInsets.only(top: 8),
//             child: Icon(Icons.settings_outlined, size: 25),
//           ),
//           title: "الاعدادات",
//           textStyle: const TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.w800,
//             fontFamily: "Cairo",
//           ),
//           activeColorPrimary: Color(0xffe7f7ec),
//           inactiveColorPrimary: Colors.grey.shade400,
//         ),
//       ],
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(60),
//         colorBehindNavBar: isDark
//             ? Colors.grey.shade900
//             : AppColors.kPrimaryColor,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: .05),
//             blurRadius: 8,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       backgroundColor: isDark ? Color(0xff00593d) : Color(0xff149f81),
//       navBarHeight: kBottomNavigationBarHeight + 10,
//       navBarStyle: NavBarStyle.style6,
//       confineToSafeArea: true,
//       hideNavigationBarWhenKeyboardAppears: true,
//       stateManagement: true,
//       resizeToAvoidBottomInset: true,
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/home/screen/home_screen.dart';
import 'package:hisn_almuslim/features/settings/screen/settings_screen.dart';
import 'package:hisn_almuslim/shared/glass_nav_bar.dart';

class Root extends StatefulWidget {
  Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with TickerProviderStateMixin {
  late PageController controller;
  late List<Widget> screens;
  int currentScreen = 0;

  late List<AnimationController> iconControllers;

  @override
  void initState() {
    super.initState();

    screens = [HomeScreen(), SettingsScreen()];

    controller = PageController(initialPage: 0);
    iconControllers = List.generate(
      4,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );
    iconControllers[currentScreen].forward();
  }

  @override
  void dispose() {
    controller.dispose();
    for (var c in iconControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() => currentScreen = index);
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOutExpo,
    );

    // Animate selected icon
    iconControllers[index].forward();

    // Reverse others
    for (var i = 0; i < iconControllers.length; i++) {
      if (i != index) iconControllers[i].reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // to not return the last screen
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: screens,
        ),
        bottomNavigationBar: GlassBottomNavBar(
          currentIndex: currentScreen,
          onTap: _onTabTapped,
          items: [
            BottomNavItemData(
              label: 'الرئيسيه',
              icon: Icon(CupertinoIcons.home),
              filledIcon: AnimatedIcon(
                icon: AnimatedIcons.menu_home,
                progress: iconControllers[0],
              ),
            ),
            BottomNavItemData(
              label: 'الاعدادات',
              icon: Icon(CupertinoIcons.settings),
              filledIcon: AnimatedIcon(
                icon: AnimatedIcons.list_view,
                progress: iconControllers[0],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
