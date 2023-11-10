// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/screens/profile/edit_password_screen.dart';
import 'package:tmshub/src/screens/profile/edit_profil_screen.dart';
import 'package:tmshub/src/utils/globals.dart' as globals;

class ProfilCard extends StatefulWidget {
  const ProfilCard({Key? key}) : super(key: key);

  @override
  State<ProfilCard> createState() => _ProfilCardState();
}

class _ProfilCardState extends State<ProfilCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _itemDetail(
              tittle: "Nama Lengkap",
              value: globals.userLogin!.namaUser,
            ),
            _itemDetail(
              tittle: "Alamat",
              value: globals.pegawaiLogin!.alamatPegawai!,
            ),
            _itemDetail(
              tittle: "Email",
              value: globals.userLogin!.emailUser,
            ),
            _itemDetail(
              tittle: "No. Telepon",
              value: globals.pegawaiLogin!.nohpPegawai!,
            ),
            _itemDetail(
              tittle: "Divisi",
              value: globals.pegawaiLogin!.divisi!,
            ),
            _itemDetail(
              tittle: "Nomor Kepegawaian",
              value: globals.pegawaiLogin!.nip!,
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditPasswordScreen()));
                },
                child: Text(
                  "Ganti kata sandi",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: HexColor("#FFFFFF"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: FloatingActionButton(
                  heroTag: "fabcustom",
                  isExtended: true,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilScreen()));
                  },
                  child: Image(
                    height: 40,
                    image: AssetImage("assets/edit-100.png"),
                    filterQuality: FilterQuality.high,
                  ),
                )),
            SizedBox(height: 20),
          ],
        ));
  }
}

Widget _itemDetail({required String tittle, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle,
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: HexColor("#4D4848"),
        ),
      ),
      SizedBox(height: 8),
      Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HexColor("#4D4848"), width: 1),
        ),
        child: Text(
          value,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      SizedBox(height: 12),
    ],
  );
}

fetchData() {}
