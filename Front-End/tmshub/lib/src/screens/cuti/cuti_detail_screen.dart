// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/widget/custom_tittle_bar.dart';

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

                      //Nama
                      Row(
                        children: [
                          Icon(Icons.person, size: 32),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#3D3D3D"),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Dimas Tri Aditya",
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
                      ),
                      SizedBox(height: 18),

                      //Mulai Cuti
                      Row(
                        children: [
                          Icon(Icons.calendar_month, size: 32),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mulai Cuti",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#3D3D3D"),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "27 Feb 2023",
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
                      ),
                      SizedBox(height: 18),

                      //Selesai Cuti
                      Row(
                        children: [
                          Icon(Icons.event_available, size: 32),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selesai Cuti",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#3D3D3D"),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "30 Feb 2023",
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
                      ),
                      SizedBox(height: 18),

                      //Disetujui oleh
                      Row(
                        children: [
                          Icon(Icons.person, size: 32),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Disetujui Oleh",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#3D3D3D"),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Grandi Ekabuana",
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
                      ),
                      SizedBox(height: 18),

                      Row(
                        children: [
                          Icon(Icons.beach_access, size: 32),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jenis Cuti",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#3D3D3D"),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Acara Keluarga",
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
                      ),
                      SizedBox(height: 18),

                      Row(
                        children: [
                          Icon(Icons.menu, size: 32),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Keterangan",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#3D3D3D"),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Acara Keluarga",
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
                      ),
                      SizedBox(height: 18),

                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 32),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sisa Cuti",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: HexColor("#3D3D3D"),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "10 Hari",
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
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
