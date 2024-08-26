import 'package:flutter/cupertino.dart';
import 'package:todo/core/extensions/localization_extensions.dart';

extension DayValueExtension on BuildContext {
  String idToDay(int id) {
    switch (id) {
      case 1:
        return localization.sunday;
      case 2:
        return localization.monday;
      case 3:
        return localization.tuesday;
      case 4:
        return localization.wednesday;
      case 5:
        return localization.thursday;
      case 6:
        return localization.friday;
      case 7:
        return localization.saturday;
      default:
        return '';
    }
  }
}

// int convertCurrentDayToServerDay(int currentDay) {
//   if (currentDay == 7) {
//     return 1;
//   } else {
//     return currentDay + 1;
//   }
// }

