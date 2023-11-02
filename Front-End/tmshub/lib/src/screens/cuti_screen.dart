// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/screens/cuti/cuti_add_screen.dart';
import 'package:tmshub/src/widgets/cuti_widgets/cuti_card.dart';
import 'package:tmshub/src/widgets/cuti_widgets/custom_tittle_bar.dart';
import 'package:tmshub/src/widgets/utility.dart';

class CutiScreen extends StatefulWidget {
  const CutiScreen({Key? key}) : super(key: key);
  @override
  _CutiScreenState createState() => _CutiScreenState();
}

class _CutiScreenState extends State<CutiScreen> {
  late bool error = false, notFound = false;
  var items = List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFAB(context, error, notFound),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 14, left: 10, right: 10),
            child: CustomTittleBar(
              tittle: "Pengajuan Cuti",
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),

          //ERROR
          if (error) errorMistakes(),

          //Data Tidak ditemukan
          if (notFound) errorNotFound(),

          //list cuti
          if (!error && !notFound)
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    // items.map((e) => e),
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

Widget _getFAB(context, con1, con2) {
  if (!con1 && !con2) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CutiAddScreen()));
        },
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
