// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/services/user_services.dart';
import 'package:tmshub/src/widgets/modal/custom_dialog.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';
import 'package:tmshub/src/utils/globals.dart' as globals;

class EditPasswordScreen extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPasswordScreen> {
  bool _oldVisibility = true, _newVisibility = true, _newReVisibility = true;
  final oldPasswordCont = TextEditingController();
  final newPasswordCont = TextEditingController();
  final newRePasswordCont = TextEditingController();

  @override
  void initState() {
    oldPasswordCont.dispose();
    newPasswordCont.dispose();
    newRePasswordCont.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopNavigation(title: "GANTI KATA SANDI"),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Jangan bagikan kepada siapapun kata sandi \nyang sudah anda ubah !!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFA8AAAE),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 30),
            _inputPassword(
              tittle: "Kata sandi sekarang",
              controller: newRePasswordCont,
              value: _oldVisibility,
              context: context,
            ),
            _inputPassword(
              tittle: "Kata sandi baru",
              controller: newPasswordCont,
              value: _newVisibility,
              context: context,
            ),
            _inputPassword(
              tittle: "Ulangi kata sandi baru",
              controller: newRePasswordCont,
              value: _newReVisibility,
              context: context,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 40, left: 20, right: 20),
        width: MediaQuery.of(context).size.width - 40,
        child: ElevatedButton(
          onPressed: () => storePassword(context),
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
    );
  }

  _toggle(bool value) {
    setState() {
      value = !value;
    }
  }

  storePassword(BuildContext context) {
    if (newPasswordCont.text == newRePasswordCont.text) {
      Map<String, dynamic> request = {
        'id_user': globals.userLogin!.idUser,
        'old_password': oldPasswordCont.text,
        'new_password': newPasswordCont.text,
      };
      changePasswordAPI(request).then((response) {
        if (response['statusCode'] == 200) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                title: "Sukses Login",
                message: "Berhasil menyimpan password!",
                type: "success",
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                title: "Gagal Menyimpan Password",
                message: "Password tidak boleh sama dengan password sebelumnya",
                type: "failed",
              );
            },
          );
        }
      }).onError((error, stackTrace) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              title: "Gagal Menyimpan Password",
              message: error.toString(),
              type: "failed",
            );
          },
        );
      });
    }
  }
}

Widget _inputPassword(
    {required String tittle,
    required controller,
    required bool value,
    context}) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            tittle,
            style: TextStyle(
              color: Color(0xFF4D4848),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              height: 0.05,
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: controller,
            obscureText: !value,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: HexColor("#565656"),
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                icon: Icon(value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
                onPressed: () {
                  setState() {
                    value = !value;
                  }
                },
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), gapPadding: 16),
              contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            ),
          ),
        ],
      ));
}
