// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
            Form(
              child: Column(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_inputText(
    {required String tittle,
    required var localVariable,
    required bool enabled}) {
  return Column(children: [
    SizedBox(height: 16),
    Text(
      tittle,
      style: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: HexColor("#565656"),
      ),
    ),
    SizedBox(height: 12),
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
        fillColor: Color.fromRGBO(168, 170, 174, 0.5),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), gapPadding: 16),
        contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
      ),
    )
  ]);
}
