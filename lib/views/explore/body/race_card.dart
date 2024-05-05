import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:racemate_clone_task/models/race_model.dart';
import 'package:racemate_clone_task/utils/spacers.dart';
import 'package:racemate_clone_task/views/explore/body/widgets/more_info.dart';
import 'package:racemate_clone_task/views/explore/body/widgets/organizer_info.dart';
import 'package:racemate_clone_task/views/explore/body/widgets/race_label.dart';

class RaceCard extends StatelessWidget {
  const RaceCard({required this.raceModel, super.key});

  final RaceModel raceModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ===== Main Card ===== //
        Container(
          height: 184,
          width: 343.w,
          padding: const EdgeInsetsDirectional.only(end: 20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: RaceMateColors.blue00,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: RaceMateColors.blue03, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(3.w, 5),
                  blurRadius: 12.r,
                  spreadRadius: -8,
                )
              ]),
          child: Row(
            children: [
              // ===== Image ===== //
              Container(
                height: 184,
                width: 117.w,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: RaceMateColors.blue01,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  "assets/races_images/${raceModel.image}",
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              // ===== Spacer ===== //
              RaceMateSpacers.spacerW10,
              // ===== Info Column ===== //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ===== Sponsered ===== //
                    const Icon(
                      Icons.stars_rounded,
                      size: 15,
                      color: RaceMateColors.blue03,
                    ),
                    // ===== Label ===== //
                    RaceLabel(text: raceModel.name!),
                    // ===== Organizer ===== //
                    if (raceModel.organizer != null)
                      OrganizerInfo(text: raceModel.organizer!),
                    // ===== More info ===== //
                    MoreInfo(
                        distances: "${raceModel.distances}",
                        date: "${raceModel.date}",
                        location: "${raceModel.city}, ${raceModel.country}")
                  ],
                ),
              ),
            ],
          ),
        ),
        // ===== Share Button =====
        Positioned(
          right: 16.w,
          bottom: 16,
          child: IconButton(
            icon: Icon(
              Icons.share_outlined,
              size: 24.sp,
              color: RaceMateColors.yellow01,
            ),
            onPressed: () {},
            tooltip: "Share",
          ),
        ),
      ],
    );
  }
}
