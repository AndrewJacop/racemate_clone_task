import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';

import 'package:get/get.dart';
import 'package:racemate_clone_task/controllers/races_controller.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/widgets/done_button.dart';

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({super.key});

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Divider(thickness: 3, indent: 140.w, endIndent: 140.w),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "RACE LOCATION",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                ListView.separated(
                  itemCount: filterController.locationList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final country =
                        filterController.locationList.keys.elementAt(index);
                    var count = filterController.locationList[country]!.count;
                    return Obx(() => Material(
                          child: CheckboxListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              selectedTileColor: RaceMateColors.blue02,
                              activeColor: RaceMateColors.blue05,
                              selected: filterController
                                  .locationList[country]!.isSelected.value,
                              title: Text("$country ($count)",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              value: filterController
                                  .locationList[country]!.isSelected.value,
                              onChanged: (value) {
                                filterController.locationList[country]!
                                        .isSelected.value =
                                    !filterController.locationList[country]!
                                        .isSelected.value;
                              }),
                        ));
                  },
                  separatorBuilder: (_, __) => const Divider(height: 0),
                ),
                DoneButton(
                  onPressed: () {
                    filterController.updateLocationFilter();
                    racesController.updateCurrentList();
                    Get.back();
                  },
                ),
              ],
            ),
            Positioned(
              top: 24,
              right: 12.w,
              child: TextButton(
                  onPressed: () {
                    filterController.clearLocationFilter();
                    Get.back();
                  },
                  child: Text(
                    "RESET",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: filterController.locationFilterActive.isTrue
                            ? RaceMateColors.orange01
                            : RaceMateColors.orange01.withOpacity(0.4)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
