// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/models/presensi_model.dart';
import 'package:tmshub/src/services/presensi_services.dart';
import 'package:tmshub/src/widgets/presensi_widgets/map_widget.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';

class PresensiMapScreen extends StatefulWidget {
  const PresensiMapScreen({Key? key, required this.loc}) : super(key: key);
  final String loc;

  @override
  _PresensiMapScreenState createState() => _PresensiMapScreenState();
}

class _PresensiMapScreenState extends State<PresensiMapScreen> {
  late Future<List<PresensiModel>> presensiData;

  @override
  void initState() {
    super.initState();
    presensiData = fetchPresensiByUser(1);
    print("========================================================");
    print(presensiData);
  }

  @override
  Widget build(BuildContext context) {
    print("=presensidata");
    print(presensiData.toString());
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
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 200,
              child: MapWidget(
                latitudeOffice: "-6.92666",
                longtitudeOffice: "107.61961",
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6), // Warna bayangan
                    offset: Offset(1, 2), // Offset bayangan (x, y)
                    blurRadius: 1, // Radius blur bayangan
                    spreadRadius: -1, // Radius penyebaran bayangan
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: HexColor("#E5F1F8"),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
