import 'package:flutter/material.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/utils/formats.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.date,
    this.active = false,
    this.onTap,
  });

  final DateTime date;
  final bool active;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      readOnly: true,
      onTap: onTap,
      style: const TextStyle(height: 0.8),
      decoration: InputDecoration(
        hintText: RaceMateFormatters.reformatDateForFilter(date),
        prefixIconColor: RaceMateColors.blue06,
        prefixIcon: const Icon(Icons.calendar_month_outlined),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: active ? RaceMateColors.orange01 : RaceMateColors.blue05,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: active ? RaceMateColors.orange01 : RaceMateColors.blue05,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
