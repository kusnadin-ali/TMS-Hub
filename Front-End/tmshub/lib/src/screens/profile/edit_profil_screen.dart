// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/widgets/cuti_widgets/custom_tittle_bar.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({Key? key}) : super(key: key);

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  dynamic temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CustomTittleBar(tittle: "UBAH DATA", onPress: () {}),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Silahkan lengkapi data dibawah ini !!!',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Color(0xFFA8AAAE),
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          formMethod(context),
        ],
      ),
    ));
  }
}

formMethod(context) {
  dynamic temp;

  return Form(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputText(
            tittle: "Nama Lengkap",
            localVariable: temp,
            enabled: false,
          ),
          _inputText(
            tittle: "Alamat",
            localVariable: temp,
            enabled: true,
          ),
          _inputText(
            tittle: "Email",
            localVariable: temp,
            enabled: true,
          ),
          _inputText(
            tittle: "No. Telepon",
            localVariable: temp,
            enabled: true,
          ),
          _inputText(
            tittle: "Divisi",
            localVariable: temp,
            enabled: false,
          ),
          _inputText(
            tittle: "Nomor Kepegawaian",
            localVariable: temp,
            enabled: false,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () => saveProfile(),
              child: Text(
                "SIMPAN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

saveProfile() {}

_inputText(
    {required String tittle,
    required var localVariable,
    required bool enabled}) {
  return Column(children: [
    SizedBox(height: 8),
    Text(
      tittle,
      style: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: HexColor("#565656"),
      ),
    ),
    SizedBox(height: 10),
    TextFormField(
      initialValue: localVariable,
      style: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: HexColor("#565656"),
      ),
      decoration: InputDecoration(
        enabled: enabled,
        filled: true,
        fillColor: !enabled ? HexColor("#80A8AAAE") : HexColor("#80FFFFFF"),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), gapPadding: 8),
        contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 10),
      ),
    )
  ]);
}
