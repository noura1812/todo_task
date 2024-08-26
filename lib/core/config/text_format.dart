import 'package:todo/core/config/date_formats.dart';

class CustomTextFormat {
  static String formatDuration(DateTime? saleDate) {
    Duration? duration = saleDate?.difference(DateTime.now());

    if (duration == null) {
      return '';
    }
    String formattedDuration = '';
    if (duration.inDays > 0) {
      formattedDuration += '${duration.inDays}d ';
    }
    if (duration.inHours.remainder(24) > 0) {
      formattedDuration += '${duration.inHours.remainder(24)}h ';
    }
    if (duration.inMinutes.remainder(60) > 0) {
      formattedDuration += '${duration.inMinutes.remainder(60)}m ';
    }
    return formattedDuration.trim();
  }

  static String formatFromToTime(DateTime from, DateTime to) {
    return ('${DateFormats.hourMinuteMeridiem.format(from)} - ${DateFormats.hourMinuteMeridiem.format(to)}');
  }
}
