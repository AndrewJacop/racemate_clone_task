import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_clone_task/utils/formats.dart';
import 'package:racemate_clone_task/views/explore/body/widgets/info_tile.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo(
      {super.key,
      required this.distances,
      required this.date,
      required this.location});

  final String distances;
  final String date;
  final String location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 195.w,
      child: Column(
        children: [
          // ===== distance ===== //
          InfoTile(
            icon: Icons.route_outlined,
            text: RaceMateFormatters.reformatDistance(distances),
          ),
          // ===== date ===== //
          InfoTile(
            icon: Icons.date_range_rounded,
            text: RaceMateFormatters.reformatDateForCard(date),
          ),
          // ===== location ===== //
          InfoTile(
            icon: Icons.route_outlined,
            text: location,
          ),
        ],
      ),
    );
  }
}
