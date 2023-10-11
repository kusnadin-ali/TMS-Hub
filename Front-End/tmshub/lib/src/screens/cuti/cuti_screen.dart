// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/widget/cuti_card.dart';
import 'package:tmshub/src/widget/custom_tittle_bar.dart';

class CutiScreen extends StatefulWidget {
  @override
  _CutiScreenState createState() => _CutiScreenState();
}

class _CutiScreenState extends State<CutiScreen> {
  late bool error = false, notFound = false;
  var items = List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFAB(error, notFound),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 14, left: 10, right: 10),
            child: CustomTittleBar(
              tittle: "Pengajuan Cuti",
              onPress: backToDashboard(),
            ),
          ),

          //ERROR
          if (error)
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  "Oops !",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: HexColor("#EA5455")),
                ),
              ),
              Image(image: AssetImage("error.png"), height: 300),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Terjadi Kesalahan",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      color: HexColor("#A09C9C")),
                ),
              ),
            ]),

          //Data Tidak ditemukan
          if (notFound)
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Image(image: AssetImage("dataNotFound.png")),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text("Data Tidak Ditemukan"),
              ),
            ]),

          //list cuti
          if (!error && !notFound)
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    // for (var item in items) Text(item),
                    for (var i = 0; i < 10; i++)
                      CutiCard(
                        tittle: "Cuti",
                        status: "PENGAJUAN HRD",
                        date: "27 Feb 2023",
                      ),
                  ],
                )),
        ]),
      ),
    );
  }
}

Widget _getFAB(con1, con2) {
  if (!con1 && !con2) {
    return FloatingActionButton(
        onPressed: () {},
        backgroundColor: HexColor("#537FE7"),
        isExtended: false,
        child: Icon(
          Icons.add_sharp,
          size: 50,
        ));
  } else {
    return Container();
  }
}

backToDashboard() {}
