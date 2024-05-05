import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_clone_task/constants/colors.dart';

class OrganizerInfo extends StatelessWidget {
  const OrganizerInfo({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 198,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Organized By",
              style: TextStyle(
                color: RaceMateColors.blue03,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1,
              )),
          Text(
            text,
            style: TextStyle(
              color: RaceMateColors.yellow02,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
