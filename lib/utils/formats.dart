import 'package:intl/intl.dart';

class RaceMateFormatters {
  static String reformatDateForCard(String dateString) {
    if (dateString.length != 8) {
      throw Exception("Invalid date string format");
    }
    DateTime unformattedDate = DateTime.parse(dateString);
    DateFormat formatter = DateFormat("dd MMM, yyyy");
    return formatter.format(unformattedDate);
  }

  static String reformatDateForFilter(DateTime unformattedDate) {
    DateFormat formatter = DateFormat("E, MMM dd, yyyy");
    return formatter.format(unformattedDate);
  }

  static String reformatDistance(String distanceString) {
    String finalString = "${distanceString.replaceAll(",", "K, ")}K";
    return finalString;
  }
}
