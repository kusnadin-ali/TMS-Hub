// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/utils/globals.dart' as globals;
import 'package:tmshub/src/widgets/top_navigation.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({Key? key}) : super(key: key);

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  // dynamic temp;
  var alamatCont = TextEditingController();
  var emailCont = TextEditingController();
  var nohpCont = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopNavigation(title: "UBAH DATA"),
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
            Container(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
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
            ),
          ],
        ),
      ),
    );
  }

  formMethod(context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _inputText(
              tittle: "Nama Lengkap",
              localVariable: globals.userLogin!.namaUser,
              enabled: false,
            ),
            _inputText(
              tittle: "Alamat",
              localVariable: globals.pegawaiLogin!.alamatPegawai!,
              controller: alamatCont,
              enabled: true,
            ),
            _inputText(
              tittle: "Email",
              localVariable: globals.userLogin!.emailUser,
              controller: emailCont,
              enabled: true,
            ),
            _inputText(
              tittle: "No. Telepon",
              localVariable: globals.pegawaiLogin!.nohpPegawai!,
              controller: nohpCont,
              enabled: true,
            ),
            _inputText(
              tittle: "Divisi",
              localVariable: globals.pegawaiLogin!.divisi!,
              enabled: false,
            ),
            _inputText(
              tittle: "Nomor Kepegawaian",
              localVariable: globals.pegawaiLogin!.nip!,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }

  saveProfile() {}

  _inputText(
      {required String tittle,
      required var localVariable,
      required bool enabled,
      var controller}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            tittle,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: HexColor("#565656"),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: localVariable,
            controller: controller,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: HexColor("#565656"),
            ),
            decoration: InputDecoration(
              enabled: enabled,
              filled: true,
              fillColor:
                  !enabled ? HexColor("#80A8AAAE") : HexColor("#80FFFFFF"),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), gapPadding: 8),
              contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 10),
            ),
          )
        ]);
  }
}
