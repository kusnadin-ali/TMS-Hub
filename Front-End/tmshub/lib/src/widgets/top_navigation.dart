// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TopNavigation extends StatefulWidget {
  final String title; // Tambahkan parameter title
  const TopNavigation({Key? key, required this.title}) : super(key: key);

  @override
  State<TopNavigation> createState() => _TopNavigationState();
}

class _TopNavigationState extends State<TopNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            Container(
              width: 53,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Icon(
                          Icons.arrow_back_outlined,
                        ),
                      ),
                    )),
              ),
              decoration: BoxDecoration(
                color: HexColor("#E5F1F8"),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Warna bayangan
                    spreadRadius: 0, // Radius penyebaran bayangan
                    blurRadius: 1, // Radius blur bayangan
                    offset: Offset(0, 2), // Posisi bayangan
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: HexColor("#E5F1F8"),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Warna bayangan
                      spreadRadius: 0, // Radius penyebaran bayangan
                      blurRadius: 1, // Radius blur bayangan
                      offset: Offset(0, 2), // Posisi bayangan
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.title.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                ),
              ),
            ),
          ],
        ));
  }
}
