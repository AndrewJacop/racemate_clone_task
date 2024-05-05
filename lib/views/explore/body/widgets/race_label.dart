import 'package:flutter/material.dart';
import 'package:racemate_clone_task/constants/colors.dart';

class RaceLabel extends StatelessWidget {
  const RaceLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 198,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: RaceMateColors.blue05,
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
