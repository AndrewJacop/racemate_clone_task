import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_clone_task/controllers/filter_controller.dart';
import 'package:racemate_clone_task/constants/colors.dart';
import 'package:get/get.dart';
import 'package:racemate_clone_task/controllers/search_controller.dart';
import 'package:racemate_clone_task/utils/spacers.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchResultController = SearchResultController.instance;
    final filterController = FilterController.instance;

    return Center(
      child: SizedBox(
          height: 56,
          width: 343.w,
          child: SearchAnchor(
              isFullScreen: false,
              searchController: searchResultController.searchControler.value,
              suggestionsBuilder: (_, controller) {
                if (controller.text.isEmpty) {
                  return [
                    ListTile(
                      title: Text(
                        "Near my location",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      leading: const Icon(Icons.room_outlined),
                      onTap: () {
                        searchResultController.onTapCountryTile('Egypt');
                        controller.closeView('Egypt');
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: Text(
                        "Suggested Races",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      leading: RaceMateSpacers.spacerW10,
                      title: Text(
                        "Cairo Marathon",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    ListTile(
                      leading: RaceMateSpacers.spacerW10,
                      title: Text(
                        "Piramid Marathon",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Recent search",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      leading: RaceMateSpacers.spacerW10,
                      title: Text(
                        "Cairo Marathon",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    ListTile(
                      leading: RaceMateSpacers.spacerW10,
                      title: Text(
                        "Piramid Marathon",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ];
                } else {
                  searchResultController.updateNameList(controller.text);
                  searchResultController.updateCountryList(controller.text);
                  if (searchResultController.searchNameList.isEmpty &&
                      searchResultController.searchCountryList.isEmpty) {
                    return [const Center(child: Text("No Result Found"))];
                  } else {
                    return [
                      // ====
                      ListTile(
                        title: Text(
                          "Countries",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      // ====
                      ...(searchResultController.searchCountryList.map(
                        (e) => ListTile(
                          title: Text(e),
                          onTap: () {
                            searchResultController.onTapCountryTile(e);
                            controller.closeView(e);
                          },
                        ),
                      )),
                      // ====
                      ListTile(
                        title: Text(
                          "Races",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      // ====
                      ...(searchResultController.searchNameList.map(
                        (e) => ListTile(
                          title: Text(e.name!),
                          onTap: () {
                            searchResultController.isSearched.value = true;
                            controller.text = e.name!;
                            searchResultController.onTapRaceTile(e.name!);
                            controller.closeView(e.name);
                          },
                        ),
                      ))
                    ];
                  }
                }
              },
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  padding:
                      const MaterialStatePropertyAll(EdgeInsets.only(left: 12)),
                  onTap: () => controller.openView(),
                  onSubmitted: (text) {
                    searchResultController.isSearched.value = true;
                    searchResultController.onTapRaceTile(text);
                    controller.closeView(text);
                  },
                  controller: controller,
                  elevation: const MaterialStatePropertyAll(0),
                  backgroundColor:
                      const MaterialStatePropertyAll(RaceMateColors.blue00),
                  shape: const MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  side: MaterialStateProperty.all(const BorderSide(
                    color: RaceMateColors.blue02,
                    width: 2,
                  )),
                  hintText: "Search Race Name or Country",
                  hintStyle: MaterialStateProperty.all(TextStyle(
                    color: RaceMateColors.blue03,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  )),
                  trailing: [
                    Obx(() => Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: searchResultController.isSearched.isFalse
                              ? const Icon(
                                  Icons.search_outlined,
                                  color: RaceMateColors.blue05,
                                  size: 32,
                                )
                              : IconButton(
                                  onPressed: () {
                                    controller.text = '';
                                    searchResultController.isSearched.value =
                                        false;
                                    filterController.clearAllFilters();
                                  },
                                  icon: const Icon(
                                    Icons.cancel_outlined,
                                    color: RaceMateColors.yellow01,
                                    size: 25,
                                  )),
                        ))
                  ],
                );
              })),
    );
  }
}
