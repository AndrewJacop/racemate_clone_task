import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:racemate_clone_task/models/country_filter_model.dart';
import 'package:racemate_clone_task/models/race_model.dart';

class RacesRepository extends GetxController {
  static RacesRepository get instance => Get.find();

  List<RaceModel> fullList = <RaceModel>[];
  Map<String, CountryFilter> countryFilterList = {};

  Future<String> loadDataFromJson(String jsonFile) async {
    await Future.delayed(const Duration(seconds: 3));
    return rootBundle.loadString(jsonFile);
  }

  Future<void> getAllRacesData() async {
    await loadDataFromJson("assets/races_data.json").then((result) {
      List<RaceModel> racesData = jsonDecode(result)
          .map<RaceModel>((item) => RaceModel.fromJson(item))
          .toList();
      fullList.addAll(racesData);
    }, onError: (err) {
      if (kDebugMode) print(err.toString());
    });
    updateCountriesMap();
  }

  void updateCountriesMap() {
    checkCountry(RaceModel race) {
      if (race.country != null) {
        countryFilterList.containsKey(race.country)
            ? countryFilterList.update(
                race.country!,
                (value) => CountryFilter(
                    count: value.count + 1, isSelected: value.isSelected))
            : countryFilterList.addIf(race.country != null, race.country!,
                CountryFilter(count: 1, isSelected: false.obs));
      }
    }

    fullList.forEach(checkCountry);
  }
}
