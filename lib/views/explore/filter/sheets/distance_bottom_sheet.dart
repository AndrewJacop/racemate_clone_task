import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';
import 'package:racemate_clone_task/controllers/races_controller.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/widgets/done_button.dart';

class DistanceBottomSheet extends StatelessWidget {
  const DistanceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = FilterController.instance;
    final racesController = RacesController.instance;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: RaceMateColors.blue00,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Divider(thickness: 3, indent: 140.w, endIndent: 140.w),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "RACE DISTANCE",
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                              "${filterController.fromDistance.value.toStringAsFixed(0)} - ${filterController.toDistance.value.toStringAsFixed(0)} K",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                        RangeSlider(
                          activeColor: RaceMateColors.yellow01,
                          min: 0,
                          max: 250,
                          values: RangeValues(
                              filterController.fromDistance.value,
                              filterController.toDistance.value),
                          onChanged: (values) {
                            filterController.fromDistance.value = values.start;
                            filterController.toDistance.value = values.end;
                          },
                        ),
                      ],
                    ),
                  )),
              DoneButton(
                onPressed: () {
                  filterController.updateDistanceFilter();
                  racesController.updateCurrentList();
                  Get.back();
                },
              )
            ]),
            Positioned(
              top: 24,
              right: 12.w,
              child: TextButton(
                  onPressed: () {
                    filterController.clearDistanceFilter();
                    Get.back();
                  },
                  child: Text(
                    "RESET",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: filterController.distanceFilterActive.isTrue
                            ? RaceMateColors.orange01
                            : RaceMateColors.orange00.withOpacity(0.4)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
