// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tmshub/src/widgets/presensi_widgets/map_widget.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';

class PresensiMapScreen extends StatelessWidget {
  const PresensiMapScreen({Key? key, required this.loc}) : super(key: key);
  final String loc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopNavigation(title: "presensi"),
          Text(loc),
          MapWidget()
        ],
      ),
    );
  }
}
