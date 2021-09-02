
import 'dart:convert';

List<ModelDataStore> modelDataStoreFromJson(String str) => List<ModelDataStore>.from(json.decode(str).map((x) => ModelDataStore.fromJson(x)));

String modelDataStoreToJson(List<ModelDataStore> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelDataStore {
  ModelDataStore({
    this.id,
    this.storeName,
    this.address,
    this.star,
    this.avrPrice,
    this.openTime,
    this.imageUrl,
    this.type,
    this.location,
  });

  String? id;
  String? storeName;
  String? address;
  double? star;
  String? avrPrice;
  String? openTime;
  String? imageUrl;
  int? type;
  int? location;

  factory ModelDataStore.fromJson(Map<String, dynamic> json) => ModelDataStore(
    id: json["_id"],
    storeName: json["store_name"],
    address: json["address"],
    star: json["star"].toDouble(),
    avrPrice: json["avr_price"],
    openTime: json["open_time"],
    imageUrl: json["image_url"],
    type: json["type"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "store_name": storeName,
    "address": address,
    "star": star,
    "avr_price": avrPrice,
    "open_time": openTime,
    "image_url": imageUrl,
    "type": type,
    "location": location,
  };
}
