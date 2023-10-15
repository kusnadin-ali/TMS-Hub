import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

Widget errorMistakes() {
  return Column(children: <Widget>[
    Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Text(
        "Oops !",
        style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: HexColor("#EA5455")),
      ),
    ),
    const Image(image: AssetImage("error.png"), height: 300),
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        "Terjadi Kesalahan",
        style: TextStyle(
            fontFamily: "Montserrat", fontSize: 18, color: HexColor("#A09C9C")),
      ),
    ),
  ]);
}

Widget errorNotFound() {
  return const Column(children: <Widget>[
    Padding(
      padding: EdgeInsets.only(top: 100),
      child: Image(image: AssetImage("dataNotFound.png")),
    ),
    Padding(
      padding: EdgeInsets.only(top: 14),
      child: Text("Data Tidak Ditemukan"),
    ),
  ]);
}
