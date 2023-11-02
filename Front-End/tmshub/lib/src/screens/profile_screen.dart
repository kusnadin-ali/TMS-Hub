// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/widgets/cuti_widgets/custom_tittle_bar.dart';
import 'package:tmshub/src/widgets/profile_widgets/change_picture.dart';
import 'package:tmshub/src/widgets/profile_widgets/profile_main.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 75, 194, 255),
                  image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fitWidth,
                    colorFilter: ColorFilter.mode(
                      const Color.fromARGB(255, 75, 194, 255),
                      BlendMode.multiply,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: CustomTittleBar(
                  tittle: "PROFIL",
                  onPress: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 170),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: HexColor("#E5F1F8"),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: ProfilCard(),
              ),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: HexColor("#E5F1F8"),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 200, left: 100),
                    child: ChangePicture(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
