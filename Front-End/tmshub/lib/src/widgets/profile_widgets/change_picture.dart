// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChangePicture extends StatelessWidget {
  const ChangePicture({size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (FloatingActionButton.small(
      backgroundColor: HexColor("#4BC2FF"),
      onPressed: () {
        showModalBottomSheet<void>(
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            backgroundColor: HexColor("#4BC2FF"),
            builder: (BuildContext context) {
              return SizedBox(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Container(
                      width: 50,
                      height: 8,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _changePictureItem(
                          tittle: "Take a Picture",
                          icon: Icons.camera_alt,
                          onPress: () {},
                        ),
                        _changePictureItem(
                          tittle: "Gallery",
                          icon: Icons.folder,
                          onPress: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 50)
                  ],
                ),
              );
            });
      },
      child: Icon(Icons.camera_alt_rounded),
    ));
  }
}

Widget _changePictureItem(
    {required String tittle, required IconData icon, required onPress}) {
  return InkWell(
    onTap: onPress,
    onDoubleTap: onPress,
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(20),
      dashPattern: const [5, 5],
      color: Colors.black,
      strokeWidth: 2,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(children: [
        Icon(
          icon,
          size: 100,
        ),
        Text(
          tittle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF3D3737),
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),
    ),
  );
}
