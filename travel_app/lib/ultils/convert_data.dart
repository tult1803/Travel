
import 'package:intl/intl.dart';

converterTime(data, {String? formatDate}) {
  int? dataInt = int.tryParse("$data");
  String format = (formatDate == null || formatDate.isEmpty) ? "HH:mm" : formatDate;
  final fDay = new DateFormat(format);
  return fDay.format(DateTime.fromMillisecondsSinceEpoch(dataInt! * 1000));
}