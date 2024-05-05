import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/controllers/races_controller.dart';
import 'package:racemate_clone_task/data/races_repository.dart';
import 'package:racemate_clone_task/models/country_filter_model.dart';

class FilterController extends GetxController {
  static FilterController get instance => Get.find();

  // ===== Type ===== //
  final typeList = ['Real-Time event', 'Virtual', 'All'];
  RxInt typeFilter = 2.obs;
  RxBool typeFilterActive = false.obs;
  updateTypeFilter() {
    typeFilterActive.value = (typeFilter.value != 2);
    updateCount();
  }

  clearTypeFilter() {
    typeFilterActive.value = false;
    typeFilter.value = 2;
    updateCount();
  }

  // ===== Location ===== //
  final locationList = RacesRepository.instance.countryFilterList;
  RxBool locationFilterActive = false.obs;
  updateLocationFilter() {
    locationFilterActive.value = true;
    updateCount();
  }

  clearLocationFilter() {
    locationFilterActive.value = false;
    resetCountryFilter(String key, CountryFilter value) {
      value.isSelected.value = false;
    }

    locationList.forEach(resetCountryFilter);
    updateCount();
  }

  // ===== Date ===== //
  var fromDate = DateTime.now().obs;
  var toDate = DateTime.now().obs;
  RxBool dateFilterActive = false.obs;
  pickFromDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));

    if (pickedDate != null && pickedDate != fromDate.value) {
      fromDate.value = pickedDate;
      dateFilterActive.value = true;
      if (pickedDate.isAfter(toDate.value)) {
        toDate.value = pickedDate;
      }
    }
  }

  pickToDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (pickedDate != null && pickedDate != toDate.value) {
      toDate.value = pickedDate;
      dateFilterActive.value = true;
      if (pickedDate.isBefore(fromDate.value)) {
        fromDate.value = pickedDate;
      }
    }
  }

  updateDateFilter() {
    dateFilterActive.value = true;
    updateCount();
  }

  clearDateFilter() {
    fromDate.value = DateTime.now();
    toDate.value = DateTime.now();
    dateFilterActive.value = false;
    updateCount();
  }

  // ===== Date ===== //
  RxDouble fromDistance = 0.0.obs;
  RxDouble toDistance = 250.0.obs;
  RxBool distanceFilterActive = false.obs;
  updateDistanceFilter() {
    distanceFilterActive.value = true;
    updateCount();
  }

  clearDistanceFilter() {
    fromDistance.value = 0.0;
    toDistance.value = 250.0;
    distanceFilterActive.value = false;
    updateCount();
  }

  // ===== Filter Count ===== //
  RxInt filterCount = 0.obs;
  updateCount() {
    filterCount.value = (typeFilterActive.isFalse ? 0 : 1) +
        (locationFilterActive.isFalse ? 0 : 1) +
        (distanceFilterActive.isFalse ? 0 : 1) +
        (dateFilterActive.isFalse ? 0 : 1);
    RacesController.instance.resetCurrentList();
  }

  clearAllFilters() {
    clearTypeFilter();
    clearLocationFilter();
    clearDateFilter();
    clearDistanceFilter();
  }
}
