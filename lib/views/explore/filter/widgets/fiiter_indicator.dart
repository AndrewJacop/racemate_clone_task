import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/utils/spacers.dart';

class FilterIndicator extends StatelessWidget {
  const FilterIndicator({super.key, required this.count, this.onTap});

  final int count;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 48.w,
          height: 32,
          decoration: BoxDecoration(
            color: RaceMateColors.blue05,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: RaceMateColors.blue05,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.filter_alt_sharp, color: Colors.white, size: 18),
              RaceMateSpacers.spacerW3,
              CircleAvatar(
                backgroundColor: RaceMateColors.yellow00,
                maxRadius: 8.5,
                child: Text('$count', style: const TextStyle(fontSize: 12)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
