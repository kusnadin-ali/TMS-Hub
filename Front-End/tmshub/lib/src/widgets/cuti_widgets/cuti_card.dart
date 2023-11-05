// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CutiCard extends StatelessWidget {
  final String tittle, status, date;

  const CutiCard(
      {Key? key,
      required this.tittle,
      required this.status,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: HexColor("#BAA4FF"),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Image(
                image: AssetImage("edit-100.png"),
                filterQuality: FilterQuality.high,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 130,
              padding: EdgeInsets.only(left: 20),
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: HexColor("#3D3D3D"),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    status,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: HexColor("#A8AAAE"),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: HexColor("#565656"),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              alignment: Alignment.center,
              splashRadius: 30,
              iconSize: 20,
              onPressed: () {},
            )
          ],
        ));
  }
}