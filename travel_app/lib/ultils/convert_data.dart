import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

String noImg = "images/no_image.png";
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

openGoogleMap(String? location) async {
  double? latitude,longitude;
  List<Location>? locations;
  try {
    locations = await locationFromAddress("$location");
  }catch(_){
    latitude = double.tryParse(location!.substring(0, location.indexOf(",")).trim());
    longitude = double.tryParse(location.substring(location.indexOf(",")).trim());
  }
  /// Check có google map ko
  bool? isGoogleMap = await MapLauncher.isMapAvailable(MapType.google);

  try {
    /// Có thì mở google map
    if (isGoogleMap!) {
      print('Google Map');
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: locations == null ? Coords(latitude!, longitude!) : Coords(
            locations.first.latitude, locations.first.longitude),
        title: "$location",
      );
    } else {
      /// Không có Google Map thì mở trình duyệt map có sẵn
      final availableMaps = await MapLauncher.installedMaps;
      print("${availableMaps.first
          .mapName}"); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]
      await availableMaps.first.showMarker(
        coords: locations == null ? Coords(latitude!, longitude!) : Coords(
            locations.first.latitude, locations.first.longitude),
        title: "$location",
      );
    }
  }catch(_){
    EasyLoading.showError("Có lỗi xảy ra", duration: Duration(seconds: 2));
  }
}
