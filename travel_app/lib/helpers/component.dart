import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/ultils/location.dart';

Widget miniContainer({BuildContext? context, String? image}) {
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

      },
      child: Text(""),
    ),
  );
}

Widget showTemp(temp, weatherMain, {Color? color}){
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