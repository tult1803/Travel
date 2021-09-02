import 'package:flutter/material.dart';
import 'package:travel_app/helpers/component.dart';

class foodCanGio extends StatefulWidget {
  const foodCanGio({Key? key}) : super(key: key);

  @override
  _foodCanGioState createState() => _foodCanGioState();
}

class _foodCanGioState extends State<foodCanGio> {
  @override
  Widget build(BuildContext context) {
    return bodyFoodCanGio(context);
  }

  Widget bodyFoodCanGio(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: Column(
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
      ),
    );
  }
}
