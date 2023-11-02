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
  bool oldVisibility = false, newVisibility = false, newReVisibility = false;

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
            CustomTittleBar(
                tittle: "GANTI KATA SANDI",
                onPress: () {
                  Navigator.pop(context);
                }),
            SizedBox(height: 15),
            _inputPassword(
              tittle: "Kata sandi sekarang",
              localVariable: oldPassword,
              value: oldVisibility,
            ),
            _inputPassword(
              tittle: "Kata sandi baru",
              localVariable: newPassword,
              value: newVisibility,
            ),
            _inputPassword(
              tittle: "Ulangi kata sandi baru",
              localVariable: newRePassword,
              value: newReVisibility,
            ),
          ],
        ),
      ),
      bottomSheet: ElevatedButton(
        onPressed: storePassword(context),
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
    );
  }
}

Widget _inputPassword(
    {required String tittle, required localVariable, required bool value}) {
  return Column(
    children: [
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
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: TextFormField(
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
            enabled: false,
            filled: true,
            fillColor: Color.fromRGBO(168, 170, 174, 0.5),
            suffixIcon: IconButton(
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
      )
    ],
  );
}

storePassword(BuildContext context) {
  //TODO: add some logic to store password via API
  return showSuccessDialog(
      context: context,
      onPress: () {
        Navigator.pop(context);
      });
}
