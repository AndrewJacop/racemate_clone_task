import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';
import 'package:racemate_clone_task/controllers/races_controller.dart';
import 'package:racemate_clone_task/data/races_repository.dart';
import 'package:racemate_clone_task/models/race_model.dart';

class SearchResultController extends GetxController {
  static SearchResultController get instance => Get.find();

  final text = '';
  final List<RaceModel> searchNameList = <RaceModel>[].obs;
  final List<String> searchCountryList = <String>[].obs;
  final searchControler = SearchController().obs;

  final isSearched = false.obs;

  updateNameList(String text) {
    searchNameList.clear();
    searchNameList.addAll(RacesRepository.instance.fullList.where(
        (element) => element.name!.toLowerCase().contains(text.toLowerCase())));
  }

  updateCountryList(String text) {
    searchCountryList.clear();
    searchCountryList.addAll(RacesRepository.instance.countryFilterList.keys
        .where((key) => key.toLowerCase().contains(text.toLowerCase())));
  }

  updateShownList() {
    RacesController.instance.currentList.clear();
    RacesController.instance.currentList.addAll(searchNameList);
  }

  onTapCountryTile(String country) {
    isSearched.value = true;
    FilterController.instance.clearAllFilters();
    FilterController.instance.locationList[country]!.isSelected.value = true;
    FilterController.instance.updateLocationFilter();
    RacesController.instance.updateCurrentList();
  }

  onTapRaceTile(String title) {
    isSearched.value = true;
    FilterController.instance.clearAllFilters();
    RacesController.instance.updateCurrentList();
  }
}
