
// ignore: import_of_legacy_library_into_null_safe
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/services/base.dart';
import 'package:location/location.dart';
import 'package:travel_app/view/home_page.dart';

getLocation() async{
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    //Lấy địa chỉ cụ thể
    final coordinates = new Coordinates(
        _locationData.latitude, _locationData.longitude);
    try {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    longtitudeNow = _locationData.longitude;
    latitudeNow = _locationData.latitude;

    return addresses.first;
  }catch(_){
      return null;
  }

}