import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:travel_app/helpers/component.dart';
import 'package:travel_app/ultils/data_color.dart';
import 'package:travel_app/ultils/location.dart';

import 'model/getWeather.dart';
import 'model/model_data_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? address = "-----";
  String? temp, adminArea = "-----";
  String? weatherMain;
  ModelWeather _modelWeather = ModelWeather();
  ModelWeather? _data;
  DataWeather weather = DataWeather();

  var dataLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          bodyTop(context),
          bodyBottom(context),
        ],
      ),
    );
  }

   Future _getDataLocation() async{
      dataLocation = await getLocation();
      setState(() {
        address = "${dataLocation.addressLine}";
        adminArea = "${dataLocation.adminArea}";
      });
    submitCity(adminArea);
  }

  Future submitCity(cityName) async{
            EasyLoading.show(
              status: "Đang tải.....",
              maskType: EasyLoadingMaskType.black,
            );

            try{
              _modelWeather = await weather.getDataWeather("$cityName");
              EasyLoading.showSuccess("Thành công",  maskType: EasyLoadingMaskType.black, duration: Duration(seconds: 1));
            }catch(_){
              EasyLoading.showError("Lỗi tải dữ liệu",  maskType: EasyLoadingMaskType.black, duration: Duration(seconds: 2));
            }
            setState(() {
              _data = _modelWeather;
              weatherMain = "${_data!.weather!.first.description!.substring(0,1).toUpperCase()}${_data!.weather!.first.description!.substring(1)}";
              temp = "${_data!.main!.temp}";
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
                   child: AutoSizeText("Vị trí hiện tại: $adminArea", style: GoogleFonts.roboto(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w400),)),
               SizedBox(height: 10,),
               Text(address!, style: GoogleFonts.roboto(color: Colors.white70, fontSize: 18),),
               showTemp("$temp", "$weatherMain",color: Colors.white),
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

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          miniContainer(image: "images/vung_tau.png"),
          miniContainer(image: "images/can_gio.png"),
        ],),
    );
  }
}
