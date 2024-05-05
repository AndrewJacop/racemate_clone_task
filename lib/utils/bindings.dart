import 'package:get/get.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';
import 'package:racemate_clone_task/controllers/races_controller.dart';
import 'package:racemate_clone_task/controllers/search_controller.dart';
import 'package:racemate_clone_task/data/races_repository.dart';

class RaceMateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RacesRepository());
    Get.put(RacesController());
    Get.put(FilterController());
    Get.put(SearchResultController());
  }
}
