import 'package:flutter/material.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/utils/spacers.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
      {super.key, required this.text, this.active = false, this.onTap});

  final String text;
  final bool active;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: !active ? Colors.white : RaceMateColors.blue05,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: RaceMateColors.blue05,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: !active ? RaceMateColors.blue05 : Colors.white),
            ),
            RaceMateSpacers.spacerW3,
            Icon(Icons.arrow_drop_down_sharp,
                color: !active ? RaceMateColors.blue05 : Colors.white)
          ],
        ),
      ),
    );
  }
}
