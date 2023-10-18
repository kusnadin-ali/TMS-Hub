// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tmshub/src/widgets/presensi_widgets/live_attend1.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';

class PresensiScreen extends StatefulWidget {
  const PresensiScreen({Key? key}) : super(key: key);

  @override
  State<PresensiScreen> createState() => _PresensiScreenState();
}

class _PresensiScreenState extends State<PresensiScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TopNavigation(title: "presensi"),
            LiveAttendPage1()
          ],
        ),
      ),
    );
  }
}