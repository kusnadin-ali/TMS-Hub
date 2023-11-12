// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/models/pegawai_model.dart';
import 'package:tmshub/src/models/user_model.dart';
import 'package:tmshub/src/services/pegawai_services.dart';
import 'package:tmshub/src/utils/globals.dart' as globals;
import 'package:tmshub/src/widgets/modal/custom_dialog.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({Key? key}) : super(key: key);

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  // dynamic temp;
  var alamatCont =
      TextEditingController(text: globals.pegawaiLogin!.alamatPegawai!);
  var emailCont = TextEditingController(text: globals.userLogin!.emailUser);
  var nohpCont =
      TextEditingController(text: globals.pegawaiLogin!.nohpPegawai!);

  @override
  void initState() {
    super.initState();
    // namaCont.text = globals.userLogin!.namaUser;
    // alamatCont.text = globals.pegawaiLogin!.alamatPegawai!;
    // emailCont.text = globals.userLogin!.emailUser;
    // nohpCont.text = globals.pegawaiLogin!.nohpPegawai!;
    // divisiCont.text = globals.pegawaiLogin!.divisi!;
    // nipCont.text = globals.pegawaiLogin!.nip!;
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
              initialValue: globals.userLogin!.namaUser,
              enabled: false,
            ),
            _inputTextCont(
              tittle: "Alamat",
              controller: alamatCont,
              enabled: true,
            ),
            _inputTextCont(
              tittle: "Email",
              controller: emailCont,
              enabled: true,
            ),
            _inputTextCont(
              tittle: "No. Telepon",
              controller: nohpCont,
              enabled: true,
            ),
            _inputText(
              tittle: "Divisi",
              initialValue: globals.pegawaiLogin!.divisi!,
              enabled: false,
            ),
            _inputText(
              tittle: "Nomor Kepegawaian",
              initialValue: globals.pegawaiLogin!.nip!,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }

  saveProfile() {
    Map<String, String> request = {
      'id_user': globals.pegawaiLogin!.idPegawai.toString(),
      'alamat_pegawai': alamatCont.text,
      'email_user': emailCont.text,
      'nohp_pegawai': nohpCont.text,
    };
    updateProfilAPI(request).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
              title: "Berhasil",
              message: "Berhasil menyimpan perubahan!",
              type: "success");
        },
      );
      updateGlobalsVariable(alamatCont.text, emailCont.text, nohpCont.text);
    }).onError((error, stackTrace) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
              title: "Gagal Menyimpan",
              message: error.toString(),
              type: "failed");
        },
      );
    });
  }

  updateGlobalsVariable(String alamat, String email, String nohp) {
    globals.userLogin = UserModel(
        idUser: globals.userLogin!.idUser,
        namaUser: globals.userLogin!.namaUser,
        emailUser: email,
        passwordUser: "*******",
        role: 1);

    globals.pegawaiLogin = PegawaiModel(
        idPegawai: globals.pegawaiLogin!.idPegawai,
        idUser: globals.pegawaiLogin!.idUser,
        fotoProfil: globals.pegawaiLogin!.fotoProfil,
        alamatPegawai: alamat,
        nohpPegawai: nohp,
        nip: globals.pegawaiLogin!.nip,
        idDivisi: globals.pegawaiLogin!.idDivisi,
        divisi: globals.pegawaiLogin!.divisi);
  }

  _inputText(
      {required String tittle,
      required bool enabled,
      required String initialValue}) {
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
            initialValue: initialValue,
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

  _inputTextCont(
      {required String tittle,
      required bool enabled,
      required TextEditingController controller}) {
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
