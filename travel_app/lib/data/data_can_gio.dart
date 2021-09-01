import 'package:flutter/material.dart';
import 'package:travel_app/helpers/component.dart';

Widget foodCanGio(BuildContext context){
  return Column(
    children: [
      foodContainer(context,
          color: Colors.white,
          border: true,
          storeName: "Quán ăn Thanh Lịch",
          location: "162 Tắc Xuất, TT. Cần Thạnh, Cần Giờ",
          star: "7.5",
          avrPrice: "100.000đ - 165.000đ",
          openTime: "08:00 - 22:30",
          linkImg: "images/can_gio/thanh_lich.png"),
    ],
  );
}