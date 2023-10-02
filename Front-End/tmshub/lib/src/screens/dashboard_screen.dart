// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 75, 194, 255),
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(255, 75, 194, 255),
                    BlendMode.multiply,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/Logo1.png', width: 130),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'zerf dex'.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Admin Office',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '023129090',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/profile.png',
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
          // Card Dasboard
          Padding(
            padding: EdgeInsets.only(left: 7, right: 7, top: 20),
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: HexColor('#E5F1F8'),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dasboard".toUpperCase(),
                        style: TextStyle(
                            color: HexColor("#5d5d5e"),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat"),
                      ),
                      SizedBox(height: 13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // card fitur
                          InkWell(
                            onTap: () {
                              print("attendance click!");
                            },
                            child: Ink(
                              color: Colors.blue,
                              child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: HexColor('#F9F6F6'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.calendar_month, size: 70),
                                  Text(
                                    "Attendance",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            )
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: HexColor('#F9F6F6'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.edit_calendar, size: 70),
                                Text(
                                  "Anual Leave",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: HexColor('#F9F6F6'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.payments, size: 70),
                                Text(
                                  "Payslip",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: HexColor('#F9F6F6'),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.account_circle, size: 70),
                                Text(
                                  "Profile",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
          // visi misi
          Padding(
            padding: EdgeInsets.only(left: 7, right: 7, top: 20),
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: HexColor('#E5F1F8'),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Visi & Misi".toUpperCase(),
                        style: TextStyle(
                            color: HexColor("#5d5d5e"),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat"),
                      ),
                      SizedBox(height: 13),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: HexColor("#ABB3B4")),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel nulla vel est venenatis vehicula ac sit amet justo. Sed id libero id neque viverra scelerisque. Sed gravida massa vitae augue mattis auctor. Suspendisse potenti. Sed non metus a nibh bibendum consectetur. Sed auctor odio nec mauris feugiat bibendum. Nullam vehicula in tortor eget varius. Suspendisse tristique tortor at tortor efficitur varius. Praesent ac neque eu odio venenatis tincidunt. Morbi consequat metus at luctus vehicula. Nullam vel laoreet massa, id suscipit massa. In tincidunt enim vel metus ultricies, non posuere quam facilisis. Donec posuere cursus sem nec fermentum. Nunc sit amet arcu id orci fringilla volutpat. Quisque quis nunc tristique, tincidunt turpis in, vestibulum justo. Vivamus"),
                      ),
                      SizedBox(height: 13),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: HexColor("#ABB3B4")),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel nulla vel est venenatis vehicula ac sit amet justo. Sed id libero id neque viverra scelerisque. Sed gravida massa vitae augue mattis auctor. Suspendisse potenti. Sed non metus a nibh bibendum consectetur. Sed auctor odio nec mauris feugiat bibendum. Nullam vehicula in tortor eget varius. Suspendisse tristique tortor at tortor efficitur varius. Praesent ac neque eu odio venenatis tincidunt. Morbi consequat metus at luctus vehicula. Nullam vel laoreet massa, id suscipit massa. In tincidunt enim vel metus ultricies, non posuere quam facilisis. Donec posuere cursus sem nec fermentum. Nunc sit amet arcu id orci fringilla volutpat. Quisque quis nunc tristique, tincidunt turpis in, vestibulum justo. Vivamus"),
                      )
                    ],
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
