// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTittleBar extends StatelessWidget {
  final String tittle;
  final onPress;

  const CustomTittleBar({Key? key, required this.tittle, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onPress,
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              color: HexColor('#E5F1F8'),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4)),
              ],
            ),
            child: const Icon(
              Icons.arrow_back_sharp,
              weight: 30,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width - 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: HexColor('#E5F1F8'),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Text(
                tittle,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ))
      ],
    );
  }
}
