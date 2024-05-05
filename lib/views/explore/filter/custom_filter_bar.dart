import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/utils/spacers.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/date_bottom_sheet.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/distance_bottom_sheet.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/location_bottom_sheet.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/type_bottom_sheet.dart';
import 'package:racemate_clone_task/views/explore/filter/widgets/fiiter_indicator.dart';
import 'package:racemate_clone_task/views/explore/filter/widgets/filter_button.dart';

class CustomFilterBar extends StatelessWidget {
  const CustomFilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilterController());

    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Row(
            children: [
              if (controller.filterCount.value > 0)
                FilterIndicator(
                  count: controller.filterCount.value,
                  onTap: () => controller.clearAllFilters(),
                ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterButton(
                        text: "Type",
                        active: controller.typeFilterActive.value,
                        onTap: () => Get.bottomSheet(const TypeBottomSheet()),
                      ),
                      RaceMateSpacers.spacerW8,
                      FilterButton(
                        text: "Location",
                        active: controller.locationFilterActive.value,
                        onTap: () =>
                            Get.bottomSheet(const LocationBottomSheet()),
                      ),
                      RaceMateSpacers.spacerW8,
                      FilterButton(
                        text: "Distance",
                        active: controller.distanceFilterActive.value,
                        onTap: () =>
                            Get.bottomSheet(const DistanceBottomSheet()),
                      ),
                      RaceMateSpacers.spacerW8,
                      FilterButton(
                        text: "Date",
                        active: controller.dateFilterActive.value,
                        onTap: () => Get.bottomSheet(const DateBottomSheet()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
