import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

converterTime(data, {String? formatDate}) {
  int? dataInt = int.tryParse("$data");
  String format =
      (formatDate == null || formatDate.isEmpty) ? "HH:mm" : formatDate;
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

void launchURL(String? url) async => await canLaunch("$url")
    ? await launch("$url")
    : throw EasyLoading.showError("Có lỗi xảy ra. Thử lại",
        duration: Duration(seconds: 2));

 openGoogleMap(String? location)async{
  List<Location> locations = await locationFromAddress("$location");
  final availableMaps = await MapLauncher.installedMaps;
  print(availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

  await availableMaps.first.showMarker(
    coords: Coords(locations.first.latitude, locations.first.longitude),
    title: "$location",
  );
}