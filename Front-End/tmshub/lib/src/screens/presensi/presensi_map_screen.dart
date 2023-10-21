// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, sort_child_properties_last, unnecessary_string_interpolations

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/models/presensi_model.dart';
import 'package:tmshub/src/services/presensi_services.dart';
import 'package:tmshub/src/widgets/presensi_widgets/map_widget.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class PresensiMapScreen extends StatefulWidget {
  const PresensiMapScreen(
      {Key? key, required this.latOffice, required this.longOffice})
      : super(key: key);
  final double latOffice;
  final double longOffice;

  @override
  _PresensiMapScreenState createState() => _PresensiMapScreenState();
}

class _PresensiMapScreenState extends State<PresensiMapScreen> {
  late Future<List<PresensiModel>> presensiData;
  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
    presensiData = fetchPresensiByUser(1);
    print("========================================================");
    print(presensiData);
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("=presensidata");
    // print(presensiData.toString());
    return Scaffold(
      body: Column(
        children: [
          TopNavigation(title: "presensi"),
          // MapWidget(),
          SizedBox(
            height: 10,
          ),
          Text("Silahkan lakukan presensi terlebih dahulu",
              style: TextStyle(
                  color: HexColor("#000"),
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10,
          ),
          contentPresensi()
        ],
      ),
    );
  }

  Widget contentPresensi() {
    final formattedTime = DateFormat('h:mm a').format(DateTime.now());
    final formattedDate =
        DateFormat('EEEE, d MMMM y', 'id_ID').format(DateTime.now());
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            mapWidget(),
            SizedBox(
              height: 10,
            ),
            clockContent(formattedTime, formattedDate),

            // Tampilkan waktu yang terus berubah
          ],
        ),
        decoration: BoxDecoration(
          color: HexColor("#E5F1F8"),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget clockContent(var formattedTime, var formattedDate) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "Waktu Presensi",
              style: TextStyle(
                color: HexColor("#000"),
                fontFamily: "Montserrat",
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "$formattedTime",
              style: TextStyle(
                color: HexColor("#000"),
                fontFamily: "Montserrat",
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "$formattedDate",
              style: TextStyle(
                color: HexColor("#000"),
                fontFamily: "Montserrat",
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: HexColor("#E5F1F8"),
            borderRadius: BorderRadius.circular(10)),
      ),
      decoration: BoxDecoration(
          color: HexColor("#C0EEF9"), borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget mapWidget() {
    return Container(
      width: 400,
      height: 200,
      child: MapWidget(
        latitudeOffice: "${widget.latOffice}",
        longtitudeOffice: "${widget.longOffice}",
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(1, 2),
            blurRadius: 1,
            spreadRadius: -1,
          ),
        ],
      ),
    );
  }
}
