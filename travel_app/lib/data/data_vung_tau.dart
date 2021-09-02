import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/helpers/component.dart';
import 'package:travel_app/ultils/convert_data.dart';

// ignore: camel_case_types
class foodVungTau extends StatefulWidget {


  @override
  _foodVungTauState createState() => _foodVungTauState();
}

class _foodVungTauState extends State<foodVungTau> {
  @override
  Widget build(BuildContext context) {
    return bodyFoodVungTau(context);
  }

  Widget bodyFoodVungTau(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          foodContainer(context,
            color: Colors.white,
            border: true,
            storeName: "Trà sữa Tasty",
            location: "152/7 Ba Cu, Phường 1, Thành phố Vũng Tầu",
            star: "6.0",
            avrPrice: "15.000đ - 30.000đ",
            openTime: "Chưa cập nhật",
            linkImg: "images/vung_tau/tra_sua_tasty.jpg"
          ),
          foodContainer(context,
              color: Colors.white,
              storeName: "Trà sữa Hoa Ly",
              location: "19 Đường 30/4, Phường 6, Thành phố Vũng Tầu",
              star: "6.0",
              avrPrice: "15.000đ - 30.000đ",
              openTime: "08:00 - 21:00",
              linkImg: "images/vung_tau/tra_sua_hoa_ly.jpg"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Bánh mì xíu mại Hàng Quyên",
              location: "37 Cô Bắc, P.4, Tp.Vũng Tàu",
              star: "7.5",
              avrPrice: "20.000đ - 25.000đ",
              openTime: "07:00 - 11:00 | 16:00 - 20:00",
              linkImg: "images/vung_tau/banh_mi_hoang_dieu.png"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Bánh Khọt 14 Hoàng Hoa Thám",
              location: "14 Hoàng Hoa Thám, P.2, Tp.Vũng Tàu",
              star: "7.8",
              avrPrice: "40.000đ - 100.000đ",
              openTime: "07:00 - 20:00",
              linkImg: "images/vung_tau/banh_khot.png"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Trứng lòng đào ở núi lớn Viba",
              location: "13 Vi Ba, Phường 1, Thành phố Vũng Tầu",
              star: "7.0",
              avrPrice: "5.000đ - 20.000đ",
              openTime: "16:00 - 21:00",
              linkImg: "images/vung_tau/trung_long_dao.png"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Cơm niêu rau Tập Tàng",
              location: "Số 5, đường Trần Hưng Đạo, TP. Vũng Tàu",
              star: "6.7",
              avrPrice: "60.000đ - 330.000đ",
              openTime: "09:00 - 22:00",
              linkImg: "images/vung_tau/com_nieu.jpg"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Lẩu cá đuối VT 7 Lượm",
              location: "37 Nguyễn Trường Tộ, P.3, Tp.Vũng Tàu",
              star: "7.3",
              avrPrice: "29.000đ - 169.000đ",
              openTime: "09:00 - 23:00",
              linkImg: "images/vung_tau/lau_ca_duoi_7_luom.png"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Lẩu Cá Đuối Trương Công Định",
              location: "44 Trương Công Định, Vũng Tàu",
              star: "6.3",
              avrPrice: "25.000đ - 220.000đ",
              openTime: "09:00 - 23:30",
              linkImg: "images/vung_tau/lau_ca_duoi_TCD.jpg"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Ốc Tự Nhiên",
              location: "34 Trần Phú, P.1,  Tp. Vũng Tàu",
              star: "7.4",
              avrPrice: "10.000đ - 120.000đ",
              openTime: "11:00 - 23:00",
              linkImg: "images/vung_tau/oc_tu_nhien.png"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Gành Hào",
              location: "Số 3, đường Trần Phú, P.5, TP. Vũng Tàu",
              star: "7.7",
              avrPrice: "300.000đ - 1.650.000đ",
              openTime: "07:00 - 23:00",
              linkImg: "images/vung_tau/ganh_hao.png"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Quán nướng Cô Nên",
              location: "20 Trần Phú, Vũng Tàu",
              star: "7.2",
              avrPrice: "100.000đ - 220.000đ",
              openTime: "15:00 - 23:30",
              linkImg: "images/vung_tau/quan_nuong_co_nen.jpg"),
          foodContainer(context,
              color: Colors.white,
              storeName: "Quán Tre nhà hàng hải sản",
              location: "411 Thống Nhất Mới, P.8, Tp.Vũng Tàu",
              star: "7.0",
              avrPrice: "50.000đ - 150.000đ",
              openTime: "11:00 - 23:00",
              linkImg: "images/vung_tau/quan_tre.png"),
        ],
      ),
    );
  }
}
