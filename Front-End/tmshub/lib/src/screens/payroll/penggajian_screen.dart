// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_brace_in_string_interps, prefer_is_empty, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/models/penggajian_model.dart';
import 'package:tmshub/src/services/penggajian_services.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';

import 'package:tmshub/src/utils/globals.dart' as globals;

class PenggajianScreen extends StatefulWidget {
  const PenggajianScreen({Key? key}) : super(key: key);

  @override
  State<PenggajianScreen> createState() => _PenggajianScreenState();
}

class _PenggajianScreenState extends State<PenggajianScreen> {
  List<PenggajianModel>? listPenggajian;
  bool isExist = false;

  @override
  void initState() {
    super.initState();
    getPenggajianByUserAPI(globals.userLogin!.idUser).then((value) {
      setState(() {
        listPenggajian = value;
        isExist = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopNavigation(title: "penggajian"),
          SizedBox(
            height: 10,
          ),
          contentPenggajian()
        ],
      ),
    );
  }

  Widget contentPenggajian() {
    if (isExist) {
      if (listPenggajian!.length != 0) {
        return Expanded(child: SingleChildScrollView(child: screenExist()));
      } else {
        return noContent();
      }
    } else {
      return problemNetwork();
    }
  }

  Widget screenExist() {
    return Column(
      children: listPenggajian!.map((penggajian) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: cardPayroll(
            month: "Januari 2023",
            amount: "${penggajian.gajiPokok}",
            status: penggajian.statusGaji,
          ),
        );
      }).toList(),
    );
  }

  Widget cardPayroll({
    required String month,
    required String amount,
    required String status,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              month,
              style: TextStyle(
                  color: HexColor("#3D3D3D"),
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Rp. ${amount}",
              style: TextStyle(
                  color: HexColor("#A8AAAE"),
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              status,
              style: TextStyle(
                  color: HexColor("#38D32A"),
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: HexColor("#f1f7fb"), borderRadius: BorderRadius.circular(15)),
    );
  }

  Widget noContent() {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no_content.png'),
          SizedBox(height: 15,),
          Text("Tidak ada data.",style: TextStyle(
              color: HexColor("#A09C9C"),
              fontFamily: "Montserrat",
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),)
        ],
      ),
    ));
  }

  Widget problemNetwork() {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/404.png'),
          SizedBox(height: 15,),
          Text("Tidak ada data.",style: TextStyle(
              color: HexColor("#A09C9C"),
              fontFamily: "Montserrat",
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),)
        ],
      ),
    ));
  }
}
