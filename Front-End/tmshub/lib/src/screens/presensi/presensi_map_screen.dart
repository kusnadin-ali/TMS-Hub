// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:flutter/material.dart';
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
          Text(widget.loc),
          MapWidget(),
        ],
      ),
    );
  }
}
