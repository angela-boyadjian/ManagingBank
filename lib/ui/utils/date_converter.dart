import 'package:mimi/ui/widgets/date/date_model.dart';

class DateConverter {
  DateConverter();

  DateModel convertDate(String rawDate) {
    List<String> dateSplit = rawDate.split("-");
    return DateModel(
        day: dateSplit[2], month: dateSplit[1], year: dateSplit[0]);
  }
}
