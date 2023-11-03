// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tmshub/src/services/reimburse_service.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';
import 'package:tmshub/src/utils/globals.dart' as globals;

class AddReimburseScreen extends StatefulWidget {
  const AddReimburseScreen({Key? key}) : super(key: key);

  @override
  State<AddReimburseScreen> createState() => _AddReimburseScreenState();
}

class _AddReimburseScreenState extends State<AddReimburseScreen> {
  final namaController = TextEditingController();
  final keteranganController = TextEditingController();
  final dateController = TextEditingController();
  final imageController = TextEditingController();
  XFile? imageLampiran;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    dateController.text = "";
    imageController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopNavigation(title: "Pengembalian Danas"),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(child: inputForm()),
          )),
        ],
      ),
    );
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    print("object ${img!.name}");

    setState(() {
      imageLampiran = img;
      imageController.text = img.name;
    });
  }

  Widget inputForm() {
    return Column(
      children: [
        // nama input
        inputColumn(
            title: "Nama Pegawai",
            editController: namaController,
            inputPlaceholder: "Enter your name."),
        inputDateColumn(
            title: "Tanggal",
            editController: dateController,
            inputPlaceholder: "Tanggal"),
        inputColumn(
            title: "Keterangan",
            editController: keteranganController,
            inputPlaceholder: "Keterangan"),
        inputPhotoColumn(
            title: "Lampiran",
            editController: imageController,
            inputPlaceholder: "Pilih berkas"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: boxOrange(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  print("click!!!!");
                  Map<String, dynamic> request = {
                    'id_user': globals.userLogin!.idUser,
                    'tanggal_reimburse': dateController.text,
                    'keterangan': keteranganController.text
                  };

                  createReimburseAPI(request).then((value) => print('berhasil'));
                },
                child: Text("Submit Pengemblian dana")),
          ),
        )
        // imageLampiran != null
        //     ? Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(8),
        //           child: Image.file(
        //             //to show image, you type like this.
        //             File(imageLampiran!.path),
        //             fit: BoxFit.cover,
        //             width: MediaQuery.of(context).size.width,
        //             height: 300,
        //           ),
        //         ),
        //       )
        //     : Text(
        //         "No Image",
        //         style: TextStyle(fontSize: 20),
        //       )
      ],
    );
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget inputColumn(
      {required String title,
      required TextEditingController editController,
      required String inputPlaceholder}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${title}",
              style: TextStyle(
                color: HexColor("#565656"),
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: '${inputPlaceholder}',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputDateColumn(
      {required String title,
      required TextEditingController editController,
      required String inputPlaceholder}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${title}",
              style: TextStyle(
                color: HexColor("#565656"),
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: '${inputPlaceholder}',
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                print(pickedDate);
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(formattedDate);

                setState(() {
                  editController.text = formattedDate;
                });
              } else {
                print("Date is not selected");
              }
            },
          ),
        ),
      ],
    );
  }

  Widget inputPhotoColumn(
      {required String title,
      required TextEditingController editController,
      required String inputPlaceholder}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${title}",
              style: TextStyle(
                color: HexColor("#565656"),
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: '${inputPlaceholder}',
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: () async {
              myAlert();
            },
          ),
        ),
      ],
    );
  }

  Widget boxOrange() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: HexColor("#FF9F43"),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: HexColor("#ffd1c7"),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 9, top: 5, bottom: 5, right: 9),
        child: Text(
          "Keterangan : Untuk teks keterangan mohon diisikan dengan alasan dari pengemblian dana",
          style: TextStyle(
            color: HexColor("#FF9F43"),
            fontFamily: "Montserrat",
            fontSize: 8,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
