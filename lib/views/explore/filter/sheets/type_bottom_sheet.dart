import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/views/explore/filter/sheets/widgets/done_button.dart';

class TypeBottomSheet extends StatelessWidget {
  const TypeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FilterController.instance;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: RaceMateColors.blue00,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(thickness: 3, indent: 140.w, endIndent: 140.w),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "RACE TYPE",
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
            ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Obx(() => RadioListTile<int>(
                      controlAffinity: ListTileControlAffinity.trailing,
                      value: index,
                      groupValue: controller.typeFilter.value,
                      onChanged: (newValue) {
                        controller.typeFilter.value = newValue!;
                      },
                      title: Text(
                        controller.typeList[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ));
              },
              separatorBuilder: (_, __) => const Divider(),
            ),
            DoneButton(
              onPressed: () {
                controller.updateTypeFilter();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
