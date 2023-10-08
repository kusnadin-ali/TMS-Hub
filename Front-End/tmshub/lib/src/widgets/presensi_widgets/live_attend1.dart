// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/models/office.dart';
import 'package:tmshub/src/screens/presensi/presensi_map_screen.dart';
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
    print(officeSelected);
    return officeList?.isEmpty == false ? pageWidget() : Text("tidak ada data");
  }

  Widget buttonDropdownWidget() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(width: 5, color: Colors.blue)),
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.white
      ),
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
        Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return PresensiMapScreen(loc: item as String);
                })
              );
      },
      hint: Align(
        alignment: Alignment.center,
        child: Text(
          "Lokasi Kerja",
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget pageWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Menentukan teks sebelah kiri
        children: [
          SizedBox(
            height: 8,
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Silahkan Pilih Lokasi Kerja",
                style: TextStyle(
                    color: HexColor("#565656"),
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              )),
          SizedBox(
            height: 5,
          ),
          buttonDropdownWidget(),
          SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: HexColor("#FF9F43"), // Warna border #FF9F43
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: HexColor("#ffd1c7"), // Warna background #ffd1c7
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 9, top: 5, bottom: 5, right: 9),
                child: Text(
                  "Silahkan pilih lokasi kerja Anda, untuk dapat menggunakan fitur live attendance.",
                  style: TextStyle(
                    color: HexColor("#FF9F43"),
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
