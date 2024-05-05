import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';
import 'package:racemate_clone_task/controllers/races_controller.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/widgets/custom_date_field.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/widgets/done_button.dart';

class DateBottomSheet extends StatelessWidget {
  const DateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FilterController.instance;
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
                    "RACE DATE",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("From",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Obx(() => CustomSearchTextField(
                        date: controller.fromDate.value,
                        active: controller.dateFilterActive.value,
                        onTap: () {
                          controller.pickFromDate();
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("To",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Obx(() => CustomSearchTextField(
                        date: controller.toDate.value,
                        active: controller.dateFilterActive.value,
                        onTap: () {
                          controller.pickToDate();
                        },
                      )),
                ),
                DoneButton(
                  onPressed: () {
                    controller.updateDateFilter();
                    RacesController.instance.updateCurrentList();
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
                    controller.clearDateFilter();
                    Get.back();
                  },
                  child: Text(
                    "RESET",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: controller.dateFilterActive.isTrue
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
