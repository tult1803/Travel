
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

converterTime(data, {String? formatDate}) {
  int? dataInt = int.tryParse("$data");
  String format = (formatDate == null || formatDate.isEmpty) ? "HH:mm" : formatDate;
  final fDay = new DateFormat(format);
  return fDay.format(DateTime.fromMillisecondsSinceEpoch(dataInt! * 1000));
}

boxDecoration(
    {required Color color,
      bool? border,
      bool? shadow,
      double? borderLeft,
      double? borderRight}) {
  return BoxDecoration(

    color: color,
    borderRadius: border == null
        ? BorderRadius.circular(0)
        : BorderRadius.only(
        topRight: Radius.circular(borderRight == null ? 0 : borderRight),
        topLeft: Radius.circular(borderLeft == null ? 0 : borderLeft)),
    boxShadow: shadow == null
    ? [
    BoxShadow(
      color: Colors.black54,
      blurRadius: 2,
      offset: Offset(1, 1), // Shadow position
    ),
    ]
    : [],
  );
}