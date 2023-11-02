// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/widgets/cuti_widgets/custom_tittle_bar.dart';

class CutiDetailScreen extends StatelessWidget {
  const CutiDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 14, left: 10, right: 10, bottom: 20),
              child: CustomTittleBar(
                tittle: "Detail Pengajuan Cuti",
                onPress: () {},
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: HexColor("#8CE5F1F8"),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: HexColor("#BAA4FF"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Image(
                              image: AssetImage("edit-100.png"),
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          SizedBox(width: 18),
                          Text(
                            "Cuti",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: HexColor("#565656"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      SizedBox(height: 12),
                      cutiDetailCard(
                          tittle: "Nama",
                          content: "Dimas Tri Aditya",
                          icon: Icons.person),
                      SizedBox(height: 18),
                      cutiDetailCard(
                          tittle: "Mulai Cuti",
                          content: "27 Feb 2023",
                          icon: Icons.calendar_month),
                      SizedBox(height: 18),
                      cutiDetailCard(
                          tittle: "Selesai Cuti",
                          content: "30 Feb 2023",
                          icon: Icons.event_available),
                      SizedBox(height: 18),
                      cutiDetailCard(
                          tittle: "Disetujui Oleh",
                          content: "Grandi Ekabuana",
                          icon: Icons.person),
                      SizedBox(height: 18),
                      cutiDetailCard(
                          tittle: "Jenis Cuti",
                          content: "Acara Keluarga",
                          icon: Icons.beach_access),
                      SizedBox(height: 18),
                      cutiDetailCard(
                          tittle: "Keterangan",
                          content: "Acara Keluarga",
                          icon: Icons.menu),
                      SizedBox(height: 18),
                      cutiDetailCard(
                          tittle: "Sisa Cuti",
                          content: "10 Hari",
                          icon: Icons.calendar_today),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

Widget cutiDetailCard(
    {required String tittle, required String content, required var icon}) {
  return Row(
    children: [
      Icon(icon, size: 32),
      SizedBox(width: 18),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tittle,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: HexColor("#3D3D3D"),
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: HexColor("#6E6E6E"),
            ),
          ),
        ],
      )
    ],
  );
}
