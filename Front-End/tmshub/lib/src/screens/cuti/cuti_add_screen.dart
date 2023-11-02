// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:tmshub/src/widgets/cuti_widgets/custom_tittle_bar.dart';
import 'package:tmshub/src/widgets/utility.dart';

class CutiAddScreen extends StatefulWidget {
  @override
  _CutiAddState createState() => _CutiAddState();
}

class _CutiAddState extends State<CutiAddScreen> {
  final String name = "Dimas Tri Aditya";
  final String sisaCuti = "12";
  String _jenisCuti = "Acara Keluarga";
  TextEditingController startDateCont = TextEditingController();
  TextEditingController endDateCont = TextEditingController();

  // _CutiAddState({required this.name});
  @override
  void initState() {
    startDateCont.text = '';
    endDateCont.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: HexColor("#537FE7"),
              foregroundColor: Colors.white),
          onPressed: () {
            showSuccessDialog(
                context: context,
                onPress: () {
                  Navigator.pop(context);
                });
          },
          child: Text("Kirim"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 14, left: 10, right: 10, bottom: 20),
              child: CustomTittleBar(
                  tittle: "Permintaan Pengajuan Cuti",
                  onPress: () {
                    Navigator.pop(context);
                  }),
            ),
            Form(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      "Nama Pegawai",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#565656"),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      initialValue: name,
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 16),
                        contentPadding:
                            EdgeInsetsDirectional.symmetric(horizontal: 20),
                      ),
                    ),
                    SizedBox(height: 16),

                    //field awal cuti
                    Text(
                      "Tanggal Cuti",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#565656"),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: startDateCont,
                      onTap: () async {
                        var temp = await _pickDate(context);
                        if (temp == null) return;
                        setState(() {
                          startDateCont.text =
                              DateFormat("d MMMM y").format(temp);
                        });
                      },
                      readOnly: true,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#565656"),
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 16,
                          ),
                          contentPadding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20,
                          ),
                          suffixIcon: Icon(Icons.event_available_outlined)),
                    ),
                    SizedBox(height: 16),

                    //field berakhir cuti
                    Text(
                      "Tanggal Berakhir Cuti",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#565656"),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: endDateCont,
                      onTap: () async {
                        var temp = await _pickDate(context);
                        if (temp == null) return;
                        setState(() {
                          endDateCont.text =
                              DateFormat("d MMMM y").format(temp);
                        });
                      },
                      readOnly: true,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#565656"),
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 16,
                          ),
                          contentPadding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20,
                          ),
                          suffixIcon: Icon(Icons.event_available_outlined)),
                    ),
                    SizedBox(height: 16),

                    Text(
                      "Jenis Cuti",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#565656"),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(110, 110, 110, 0.7),
                            width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButton(
                        value: _jenisCuti,
                        onChanged: _dropdownCallback,
                        icon: Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        focusColor: Colors.transparent,
                        underline: SizedBox(),
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: HexColor("#565656"),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: "Acara Keluarga",
                            child: Text("Acara Keluarga"),
                          ),
                          DropdownMenuItem(
                            value: "Cuti Hamil",
                            child: Text("Cuti Hamil"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    Text(
                      "Sisa Cuti",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#565656"),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      initialValue: '$sisaCuti Hari',
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 16),
                        contentPadding:
                            EdgeInsetsDirectional.symmetric(horizontal: 20),
                      ),
                    ),
                    SizedBox(height: 16),

                    // field keterangan
                    Text(
                      "Keterangan",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#565656"),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 16),
                        contentPadding:
                            EdgeInsetsDirectional.symmetric(horizontal: 20),
                      ),
                    ),

                    //Note
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: HexColor("#4DFF9F43"),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Text(
                        "Keterangan : Untuk teks keterangan mohon diisikan dengan alasan dari pengambilan cuti.",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: HexColor("#FFFF9F43"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  backToAnnualLeave() {}

  _pickDate(BuildContext context) {
    var now = DateTime.now();
    final newDate = showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 5),
    );
    return newDate;
  }

  void _dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _jenisCuti = selectedValue;
      });
    }
  }
}
