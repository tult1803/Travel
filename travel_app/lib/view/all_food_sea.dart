// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/helpers/component.dart';
import 'package:travel_app/presenter/load_store.dart';
import 'package:travel_app/ultils/convert_data.dart';
import 'package:travel_app/ultils/data_color.dart';
import 'package:travel_app/view/home_page.dart';

import '../model/get_weather.dart';
import '../model/model_data_weather.dart';

// ignore: must_be_immutable
class FoodSea extends StatefulWidget {
  int location;

  FoodSea({required this.location});

  @override
  _FoodSeaState createState() => _FoodSeaState();
}

class _FoodSeaState extends State<FoodSea> with TickerProviderStateMixin {
  TabController? _tabController;

  // String? windSpeed = "-----", humidity = "-----";
  String? temp, seaName, sunRise = "-----";
  String? weatherMain, dateNow = "-----", sunSet = "-----";
  ModelWeather _modelWeather = ModelWeather();
  ModelWeather? _data;
  DataWeather weather = DataWeather();
  var dataLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, initialIndex: 0, vsync: this);
    submitCity();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController!.dispose();
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

  Future submitCity() async {
    setState(() {
      widget.location == 1 ? seaName = 'Vũng Tàu' : seaName = "Cần Giờ";
    });
    try {
      _modelWeather = await weather.getDataWeather("$seaName");
    } catch (_) {
      EasyLoading.showError("Lỗi tải dữ liệu",
          maskType: EasyLoadingMaskType.black, duration: Duration(seconds: 2));
    }
    setState(() {
      _data = _modelWeather;
      weatherMain =
          "${_data!.weather!.first.description!.substring(0, 1).toUpperCase()}${_data!.weather!.first.description!.substring(1)}";
      temp = "${_data!.main!.temp}";
      // humidity = "${_data!.main!.humidity}";
      // windSpeed = "${_data!.wind!.speed}";
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
      // height: size.height * 0.2,
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
                    "Vị trí hiện tại: $seaName",
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
                "Bình minh: $sunRise     Hoàng hôn: $sunSet",
                style: GoogleFonts.roboto(color: Colors.white70, fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyBottom(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.2),
        width: size.width,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        // child: widget.seaName == "Cần Giờ" ? foodCanGio(context) : foodVungTau(context),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20, right: 10),
                child: Row(
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
                )),
            Container(
                margin: EdgeInsets.only(top: 5),
                width: size.width,
                height: 40,
                child: Center(child: tabBar())),
            Expanded(child: tabBarView()),
          ],
        ),
      ),
    );
  }

  Widget tabBar() {
    return TabBar(
      indicatorColor: Colors.white,
      isScrollable: true,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.5),
      controller: _tabController,
      labelStyle: GoogleFonts.roboto(fontSize: 15),

      tabs: <Widget>[
        Tab(text: "Nước uống"),
        Tab(text: "Ăn vặt"),
        Tab(text: "Ăn no"),
        Tab(text: "Vui chơi"),
        Tab(text: "Tất cả"),
      ],
    );
  }

  Widget tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        foodOfLocation(typeOfStore: 1, location: widget.location),
        foodOfLocation(typeOfStore: 2, location: widget.location),
        foodOfLocation(typeOfStore: 3, location: widget.location),
        foodOfLocation(typeOfStore: 4, location: widget.location),
        foodOfLocation(typeOfStore: null, location: widget.location),
      ],
    );
  }
}
