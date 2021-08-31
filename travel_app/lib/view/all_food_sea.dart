import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/helpers/component.dart';
import 'package:travel_app/ultils/convert_data.dart';
import 'package:travel_app/ultils/data_color.dart';
import 'package:travel_app/view/home_page.dart';

import '../model/getWeather.dart';
import '../model/model_data_weather.dart';

// ignore: must_be_immutable
class FoodSea extends StatefulWidget {
  String seaName;

  FoodSea({required this.seaName});

  @override
  _FoodSeaState createState() => _FoodSeaState();
}

class _FoodSeaState extends State<FoodSea> {
  String? windSpeed = "-----", dateNow = "-----";
  String? temp, sunRise = "-----";
  String? weatherMain, humidity = "-----", sunSet = "-----";
  ModelWeather _modelWeather = ModelWeather();
  ModelWeather? _data;
  DataWeather weather = DataWeather();

  var dataLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    submitCity(widget.seaName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          bodyTop(context),
          Positioned(child: bodyBottom(context)),
        ],
      ),
    );
  }

  Future submitCity(cityName) async {
    try {
      _modelWeather = await weather.getDataWeather("$cityName");
    } catch (_) {
      EasyLoading.showError("Lỗi tải dữ liệu",
          maskType: EasyLoadingMaskType.black, duration: Duration(seconds: 2));
    }
    setState(() {
      _data = _modelWeather;
      weatherMain =
          "${_data!.weather!.first.description!.substring(0, 1).toUpperCase()}${_data!.weather!.first.description!.substring(1)}";
      temp = "${_data!.main!.temp}";
      humidity = "${_data!.main!.humidity}";
      windSpeed = "${_data!.wind!.speed}";
      sunRise = converterTime("${_data!.sys!.sunrise}");
      sunSet = converterTime("${_data!.sys!.sunset}");
      dateNow = converterTime("${_data!.dt}", formatDate: "hh:mm - dd/MM");
      // _translate();
    });
  }

  Widget bodyTop(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.4,
      color: colorHexa("7265fa"),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: size.width,
                  child: AutoSizeText(
                    "Vị trí hiện tại: ${widget.seaName}",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 5,
              ),
              showTemp("$temp", "$weatherMain", color: Colors.white),
              Text(
                "Độ ẩm: $humidity     Sức gió: $windSpeed m/s",
                style: GoogleFonts.roboto(color: Colors.white70, fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Bình minh: $sunRise     Hoàng hôn: $sunSet",
                style: GoogleFonts.roboto(color: Colors.white70, fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white70,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Quay lại",
                          style: GoogleFonts.roboto(
                              color: Colors.white70, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 30),
                      child: Text(
                        "$dateNow",
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyBottom(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(1, 0),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
      ),
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
          ),
          child: Column(
            children: [
              foodContainer(context,
                  color: Colors.white,
                  border: true,
                  storeName: "Bánh mì xíu mại Hàng Quyên",
                  location: "37 Cô Bắc, P.4, Tp.Vũng Tàu, Vũng Tàu",
                  star: "7.5",
                  avrPrice: "20.000đ - 25.000đ",
                  linkImg: "images/banh_mi_hoang_dieu.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Ốc Tự Nhiên",
                  location: "34 Trần Phú, P.1,  Tp. Vũng Tàu, Vũng Tàu",
                  star: "7.4",
                  avrPrice: "10.000đ - 120.000đ",
                  linkImg: "images/oc_tu_nhien.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Lẩu cá đuối VT 7 Lượm",
                  location: "37 Nguyễn Trường Tộ, P.3, Tp.Vũng Tàu, Vũng Tàu",
                  star: "7.3",
                  avrPrice: "29.000đ - 169.000đ",
                  linkImg: "images/lau_ca_duoi_7_luom.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Gành Hào",
                  location: "Số 3, đường Trần Phú, P.5, TP. Vũng Tàu",
                  star: "7.7",
                  avrPrice: "300.000đ - 1.650.000đ",
                  linkImg: "images/oc_tu_nhien.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Lẩu Cá Đuối Trương Công Định",
                  location: "44 Trương Công Định, Vũng Tàu",
                  star: "6.3",
                  avrPrice: "25.000đ - 220.000đ",
                  linkImg: "images/oc_tu_nhien.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Quán nướng Cô Nên",
                  location: "20 Trần Phú, Vũng Tàu",
                  star: "7.2",
                  avrPrice: "100.000đ - 220.000đ",
                  linkImg: "images/oc_tu_nhien.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Cơm niêu rau Tập Tàng",
                  location: "Số 5, đường Trần Hưng Đạo, TP. Vũng Tàu",
                  star: "6.7",
                  avrPrice: "60.000đ - 330.000đ",
                  linkImg: "images/oc_tu_nhien.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Quán Tre nhà hàng hải sản",
                  location: "411 Thống Nhất Mới, P.8, Tp.Vũng Tàu, Vũng Tàu",
                  star: "7.0",
                  avrPrice: "50.000đ - 150.000đ",
                  linkImg: "images/oc_tu_nhien.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Bánh Khọt 14 Hoàng Hoa Thám",
                  location: "14 Hoàng Hoa Thám, P.2, Tp.Vũng Tàu, Vũng Tàu",
                  star: "7.8",
                  avrPrice: "40.000đ - 100.000đ",
                  linkImg: "images/oc_tu_nhien.png"),
              foodContainer(context,
                  color: Colors.white,
                  storeName: "Trứng lòng đào ở núi lớn Viba",
                  location: "Trên núi Viba, Phường 1, Vũng Tàu",
                  star: "7.0",
                  avrPrice: "5.000đ - 20.000đ",
                  linkImg: "images/oc_tu_nhien.png"),
            ],
          ),
        ),
      ),
    );
  }
}
