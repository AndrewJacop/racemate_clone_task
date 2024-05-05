import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';
import 'package:racemate_clone_task/controllers/search_controller.dart';
import 'package:racemate_clone_task/data/races_repository.dart';
import 'package:racemate_clone_task/models/race_model.dart';

class RacesController extends GetxController
    with StateMixin<List<RaceModel>>, ScrollMixin {
  static RacesController get instance => Get.find();

  final racesRepo = Get.put(RacesRepository());

  RxList<RaceModel> currentList = <RaceModel>[].obs;

  bool getInitData = false;
  bool gotLastData = false;

  int startIndex = 0;
  int endIndex = 10;

  final isLoading = true.obs;
  final isAdding = false.obs;

  @override
  void onInit() {
    RacesRepository.instance
        .getAllRacesData()
        .then((_) => getCurrentRacesList());
    super.onInit();
  }

  @override
  Future<void> onTopScroll() async {
    if (kDebugMode) print('=> onTopScroll');
  }

  @override
  Future<void> onEndScroll() async {
    if (getInitData &&
        !gotLastData &&
        FilterController.instance.filterCount.value == 0) {
      await getCurrentRacesList();
    } else {
      if (kDebugMode) print('=> onEndScroll');
    }
  }

  Future<void> getCurrentRacesList() async {
    if (!getInitData) {
      // ===== first load ===== //
      isLoading.value = false;
      getInitData = true;
      currentList.addAll(racesRepo.fullList.sublist(0, 10));
      change(currentList, status: RxStatus.success());
    } else if (getInitData && !gotLastData) {
      // ===== additional loads ===== //
      isAdding.value = true;
      change(currentList, status: RxStatus.loadingMore());
      await Future.delayed(const Duration(seconds: 3));
      startIndex = endIndex;
      endIndex = endIndex + 3;
      if (endIndex >= racesRepo.fullList.length) {
        endIndex = racesRepo.fullList.length;
        gotLastData = true;
      }
      currentList.addAll(racesRepo.fullList.sublist(startIndex, endIndex));
      change(currentList, status: RxStatus.success());
      isAdding.value = false;
    }
  }

  void updateCurrentList() {
    final filterController = FilterController.instance;
    final searchResultController = SearchResultController.instance;

    currentList.value = racesRepo.fullList.where((race) {
      // ===== filter by SEARCH ===== //
      if (searchResultController.isSearched.isTrue) {
        final searchTitle = searchResultController.searchControler.value.text;
        if (searchTitle.isNotEmpty) {
          if (race.name! != searchTitle) {
            return false;
          }
        }
      }
      // ===== filter by DATE ===== //
      if (filterController.dateFilterActive.isTrue) {
        final currentDate = DateTime.parse(race.date!);
        if (currentDate.isAfter(filterController.toDate.value) ||
            currentDate.isBefore(filterController.fromDate.value)) return false;
      }
      // ===== filter by LOCATION ===== //
      if (filterController.locationFilterActive.isTrue) {
        if (filterController.locationList[race.country]!.isSelected.value ==
            false) return false;
      }
      // ===== filter by DISTANCE ===== //
      if (filterController.distanceFilterActive.isTrue) {
        final List<double> raceDistances =
            race.distances!.split(",").map((e) => double.parse(e)).toList();
        bool init = false;
        for (double d in raceDistances) {
          if (d >= filterController.fromDistance.value &&
              d <= filterController.toDistance.value) init = true;
        }
        if (!init) return init;
      }
      return true;
    }).toList();
    change(currentList, status: RxStatus.success());
  }

  void resetCurrentList() {
    currentList.clear();
    getInitData = false;
    gotLastData = false;
    getCurrentRacesList();
    change(currentList, status: RxStatus.success());
  }
}
