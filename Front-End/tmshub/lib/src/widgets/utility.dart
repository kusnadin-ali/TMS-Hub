// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget errorMistakes() {
  return Column(children: <Widget>[
    Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Text(
        "Oops !",
        style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: HexColor("#EA5455")),
      ),
    ),
    const Image(image: AssetImage("error.png"), height: 300),
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        "Terjadi Kesalahan",
        style: TextStyle(
            fontFamily: "Montserrat", fontSize: 18, color: HexColor("#A09C9C")),
      ),
    ),
  ]);
}

Widget errorNotFound() {
  return const Column(children: <Widget>[
    Padding(
      padding: EdgeInsets.only(top: 100),
      child: Image(image: AssetImage("dataNotFound.png")),
    ),
    Padding(
      padding: EdgeInsets.only(top: 14),
      child: Text("Data Tidak Ditemukan"),
    ),
  ]);
}

showSuccessDialog({required context, required onPress}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: HexColor("#FFF8F3F3"),
          shadowColor: HexColor("#7AE5F1F8"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            constraints: BoxConstraints(maxHeight: 300),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 36),
                  Icon(
                    Icons.check_circle,
                    size: 100,
                    color: HexColor("#27C66E"),
                  ),
                  SizedBox(height: 22),
                  Text(
                    "SUKSES",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#3D3D3D"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Permintaan Anda telah dikirim \nberhasil",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#994B465C"),
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onPress,
                        child: Text(
                          "OK",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#FFFFFF"),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      });
}
