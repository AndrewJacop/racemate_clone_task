import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/views/explore/explore_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: const Color(0xff1c325f),
          title:
              Image.asset("assets/logo/full-logo-horizontal.png", height: 24.h),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.contact_support, color: Colors.amber)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.contact_support, color: Colors.amber))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          backgroundColor: RaceMateColors.yellow01,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              "assets/logo/Yellow-Logo-Icon.png",
              color: RaceMateColors.blue05,
              fit: BoxFit.cover,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(
          () => StylishBottomBar(
            elevation: 0,
            backgroundColor: Colors.white,
            option: AnimatedBarOptions(iconStyle: IconStyle.animated),
            onTap: (index) => controller.selectedIndex.value = index,
            currentIndex: controller.selectedIndex.value,
            fabLocation: StylishBarFabLocation.center,
            items: [
              BottomBarItem(
                icon: const Icon(Icons.home),
                selectedIcon:
                    const Icon(Icons.home, color: RaceMateColors.blue05),
                title: const Text("HOME"),
                selectedColor: RaceMateColors.blue05,
              ),
              BottomBarItem(
                icon: const Icon(Icons.track_changes),
                selectedIcon: const Icon(Icons.track_changes,
                    color: RaceMateColors.blue05),
                title: const Text("TRAIN"),
                selectedColor: RaceMateColors.blue05,
              ),
              BottomBarItem(
                icon: const Icon(Icons.search),
                selectedIcon:
                    const Icon(Icons.search, color: RaceMateColors.blue05),
                title: const Text("EXPLORE"),
                selectedColor: RaceMateColors.blue05,
              ),
              BottomBarItem(
                icon: const Icon(Icons.show_chart),
                selectedIcon:
                    const Icon(Icons.show_chart, color: RaceMateColors.blue05),
                title: const Text("ME"),
                selectedColor: RaceMateColors.blue05,
              ),
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    const ExploreScreen(),
    const Center(
      child: Text("Another Page"),
    ),
    const Center(
      child: Text("Another Page"),
    ),
    const Center(
      child: Text("Another Page"),
    ),
  ];
}
