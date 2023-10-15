// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tmshub/src/models/office.dart';
import 'package:tmshub/src/services/attendance_services.dart';

class LiveAttendPage1 extends StatefulWidget {
  const LiveAttendPage1({Key? key}) : super(key: key);

  @override
  State<LiveAttendPage1> createState() => _LiveAttendPage1State();
}

class _LiveAttendPage1State extends State<LiveAttendPage1> {
  List<Office>? officeList;

  String? officeSelected;

  @override
  void initState() {
    super.initState();
    fetchDataOffice().then((value) {
      setState(() {
        officeList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Center(
          child: officeList?.isEmpty == false
              ? buttonDropdownWidget()
              : Text("tidak ada data")),
    );
  }

  Widget buttonDropdownWidget() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 3, color: Colors.blue))),
      value: officeSelected,
      items: officeList
              ?.map((e) => DropdownMenuItem<String>(
                    value: e.loc,
                    child: Text(
                      e.name,
                      style: TextStyle(fontSize: 24),
                    ),
                  ))
              .toList() ??
          [],
      onChanged: (item) {
        setState(() {
          officeSelected = item;
        });
      },
    );
  }
}
