// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/widgets/cuti_widgets/custom_tittle_bar.dart';
import 'package:tmshub/src/widgets/utility.dart';

class EditPasswordScreen extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPasswordScreen> {
  dynamic oldPassword, newPassword, newRePassword;
  bool _oldVisibility = true, _newVisibility = false, _newReVisibility = false;
  final oldPasswordCont = TextEditingController();

  @override
  void initState() {
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
              CustomTittleBar(
                  tittle: "GANTI KATA SANDI",
                  onPress: () {
                    Navigator.pop(context);
                  }),
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
                localVariable: oldPassword,
                value: _oldVisibility,
                context: context,
              ),
              _inputPassword(
                tittle: "Kata sandi baru",
                localVariable: newPassword,
                value: _newVisibility,
                context: context,
              ),
              _inputPassword(
                tittle: "Ulangi kata sandi baru",
                localVariable: newRePassword,
                value: _newReVisibility,
                context: context,
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          width: MediaQuery.of(context).size.width - 40,
          height: 20,
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
        ));
  }
}

Widget _inputPassword(
    {required String tittle,
    required localVariable,
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
            initialValue: localVariable,
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

_toggle(bool value) {
  setState() {
    value = !value;
  }
}

storePassword(BuildContext context) {
  //TODO: add some logic to store password via API

  return showSuccessDialog(
      context: context,
      onPress: () {
        Navigator.of(context, rootNavigator: true).pop();
      });
}
