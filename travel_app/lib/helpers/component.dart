// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/ultils/convert_data.dart';
import 'package:travel_app/view/all_food_sea.dart';

Widget miniContainer(
    {BuildContext? context, String? image, required String seaName}) {
  return Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        image: AssetImage("$image"),
        fit: BoxFit.cover,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black54,
          blurRadius: 3,
          offset: Offset(1, 1), // Shadow position
        ),
      ],
    ),
    // ignore: deprecated_member_use
    child: FlatButton(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
      onPressed: () {
        Navigator.of(context!).push(MaterialPageRoute(
          builder: (context) => FoodSea(seaName: seaName),
        ));
      },
      child: Text(""),
    ),
  );
}

Widget foodContainer(BuildContext context,
    {required Color color,
    bool? border,
    required String linkImg,
    required String storeName,
    required String avrPrice,
    required String star,
    required String location}) {
  var size = MediaQuery.of(context).size;
  return Container(
    height: 150,
    width: size.width,
    decoration: boxDecoration(
        color: color, border: border, borderLeft: 20, borderRight: 20),
    child: Row(
      children: [
        Container(
          width: size.width * 0.3,
          decoration: boxDecoration(
              color: color, border: border, borderLeft: 20, shadow: false),
          child: Image.asset("$linkImg", height: 110,),
        ),
        Flexible(
            child: Container(
          decoration: boxDecoration(
              color: color, border: border, borderRight: 20, shadow: false),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width,
                  height: 30,
                  child: AutoSizeText(
                    "$storeName",
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              componentRowFood(
                  icon: Icons.location_on_outlined, content: location),
              SizedBox(
                height: 5,
              ),
              componentRowFood(icon: Icons.attach_money, content: "$avrPrice"),
              SizedBox(
                height: 5,
              ),
              componentRowFood(icon: Icons.star_border, content: "$star"),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                width: size.width,
                child: Text("Chỉ đường",
                    style: GoogleFonts.roboto(color: Colors.blueAccent)),
              )),
            ],
          ),
        )),
      ],
    ),
  );
}

Widget componentRowFood({icon, content}) {
  return Row(
    children: [
      Container(
          height: 25,
          width: 25,
          child: Icon(
            icon,
            color: Colors.black54,
          )),
      Flexible(
        child: Text(
          "$content",
          style: GoogleFonts.roboto(fontSize: 18, color: Colors.black54),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

Widget showTemp(temp, weatherMain, {Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, left: 0),
    child: Container(
      height: 45,
      child: Row(
        children: [
          Text(
            "${temp!.contains("null") ? "----" : temp}",
            style: GoogleFonts.roboto(fontSize: 30, color: color),
          ),
          Container(
              alignment: Alignment.topCenter,
              child: Text(
                " o",
                style: GoogleFonts.roboto(fontSize: 15, color: color),
              )),
          Text(
            "C - ",
            style: GoogleFonts.roboto(fontSize: 30, color: color),
          ),
          Flexible(
            child: AutoSizeText(
              "${weatherMain!.contains("null") ? "----" : weatherMain}",
              style: GoogleFonts.roboto(fontSize: 30, color: color),
            ),
          ),
        ],
      ),
    ),
  );
}
