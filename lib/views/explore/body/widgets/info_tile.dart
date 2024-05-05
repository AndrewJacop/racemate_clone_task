import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/utils/spacers.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.text,
    required this.icon,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: RaceMateColors.blue05,
        ),
        RaceMateSpacers.spacerW3,
        SizedBox(
          width: 150.w,
          child: Text(text,
              style: const TextStyle(
                color: RaceMateColors.blue05,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              )),
        )
      ],
    );
  }
}
