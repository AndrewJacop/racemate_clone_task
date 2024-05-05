import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/controllers/races_controller.dart';
import 'package:racemate_clone_task/views/explore/filter/custom_filter_bar.dart';
import 'package:racemate_clone_task/views/explore/body/race_card.dart';
import 'package:racemate_clone_task/views/explore/search/custom_search_bar.dart';

class ExploreScreen extends GetView<RacesController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: controller.obx(
        (state) {
          if (state!.isEmpty) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: const CustomSearchBar(),
                ),
                // ===== Filter ===== //
                const CustomFilterBar(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'No Races Found',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          } else {
            return ListView.builder(
              controller: controller.scroll,
              itemCount: state.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: const CustomSearchBar(),
                      ),
                      // ===== Filter ===== //
                      const CustomFilterBar(),
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: RaceCard(raceModel: state[index]),
                      ),
                    ],
                  );
                }
                if (index == state.length - 1) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: RaceCard(raceModel: state[index]),
                      ),
                      if (controller.isAdding.isTrue)
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                            color: RaceMateColors.yellow01,
                          ),
                        ),
                    ],
                  );
                }
                return Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: RaceCard(raceModel: state[index]),
                );
              },
            );
          }
        },
        // ===== Loading Animation ===== //
        onLoading: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: const CustomSearchBar(),
            ),
            const CustomFilterBar(),
            Image.asset("assets/logo/animation.gif"),
          ],
        ),
        // ===== Empty ===== //
        onEmpty: const Center(
          child: Text(
            'No Races Found',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
