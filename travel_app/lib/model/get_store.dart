import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/ultils/url.dart';

import 'model_data_store.dart';

class DataStore {
  getDataStore({required int location, int? typeOfStore}) async {
    final response = await http.get(Uri.https(
        "$mainUrl", "$pathUrl", {"location": "$location", "type": "${typeOfStore == null ? "" : typeOfStore}"}));
    print('Status API Store: ${response.statusCode}');
    return  modelDataStoreFromJson(response.body);
  }
}
