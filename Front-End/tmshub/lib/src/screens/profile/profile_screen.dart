// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tmshub/src/screens/profile/edit_password_screen.dart';
import 'package:tmshub/src/screens/profile/edit_profil_screen.dart';
import 'package:tmshub/src/services/pegawai_services.dart';
import 'package:tmshub/src/widgets/modal/custom_dialog.dart';
import 'package:tmshub/src/widgets/top_navigation.dart';
import 'package:tmshub/src/utils/globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

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
                child: TopNavigation(
                  title: "PROFIL",
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
                child: profilCard(),
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
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          globals.urlAPI + globals.pegawaiLogin!.fotoProfil!),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 200, left: 100),
                    child: modalPicture(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future getImage(ImageSource media) async {
    var imageFile = await picker.pickImage(source: media);
    Map<String, String> request = {
      'id_pegawai': globals.pegawaiLogin!.idPegawai.toString(),
    };
    changePictureAPI(request, imageFile).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
              title: "Berhasil",
              message: "Berhasil mengubah foto!",
              type: "success");
        },
      );
    });
  }

  Widget modalPicture() {
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
                          onPress: () {
                            Navigator.pop(context);
                            getImage(ImageSource.camera);
                          },
                        ),
                        _changePictureItem(
                          tittle: "Gallery",
                          icon: Icons.folder,
                          onPress: () {
                            Navigator.pop(context);
                            getImage(ImageSource.gallery);
                          },
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

  Widget profilCard() {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _itemDetail(
              tittle: "Nama Lengkap",
              value: globals.userLogin!.namaUser,
            ),
            _itemDetail(
              tittle: "Alamat",
              value: globals.pegawaiLogin!.alamatPegawai!,
            ),
            _itemDetail(
              tittle: "Email",
              value: globals.userLogin!.emailUser,
            ),
            _itemDetail(
              tittle: "No. Telepon",
              value: globals.pegawaiLogin!.nohpPegawai!,
            ),
            _itemDetail(
              tittle: "Divisi",
              value: globals.pegawaiLogin!.divisi!,
            ),
            _itemDetail(
              tittle: "Nomor Kepegawaian",
              value: globals.pegawaiLogin!.nip!,
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditPasswordScreen()));
                },
                child: Text(
                  "Ganti kata sandi",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: HexColor("#FFFFFF"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: FloatingActionButton(
                  heroTag: "fabcustom",
                  isExtended: true,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilScreen()));
                  },
                  child: Image(
                    height: 40,
                    image: AssetImage("assets/edit-100.png"),
                    filterQuality: FilterQuality.high,
                  ),
                )),
            SizedBox(height: 20),
          ],
        ));
  }

  Widget _itemDetail({required String tittle, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: HexColor("#4D4848"),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: HexColor("#4D4848"), width: 1),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
