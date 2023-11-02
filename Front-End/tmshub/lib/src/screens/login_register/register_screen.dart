// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmshub/src/screens/login_register/login_screen.dart';
import 'package:tmshub/src/services/user_services.dart';
import 'package:tmshub/src/widgets/modal/custom_dialog.dart';
// import 'package:tmshub/src/models/user_model.dart';
// import 'package:tmshub/src/screens/dashboard_screen.dart';
// import 'package:tmshub/src/services/user_services.dart';
// import 'package:tmshub/src/widgets/modal/custom_dialog.dart';
// import 'package:tmshub/src/utils/globals.dart' as globals;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              topBackgroundRegister(),
              inputForm(),
              SizedBox(
                height: 5,
              ),
              buttonDaftar()
            ],
          ),
        ),
      ),
    );
  }

  Widget topBackgroundRegister() {
    return Column(
      children: [
        Image.asset('assets/login_image.png'),
        SizedBox(
          height: 12,
        ),
        Text(
          "REGISTER",
          style: TextStyle(
              color: HexColor("#0D0E0E"),
              fontFamily: "Inter",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget inputForm() {
    return Column(
      children: [
        // nama input
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Nama",
              style: TextStyle(
                  color: HexColor("#0D0E0E"),
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: namaController,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        // email input
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: TextStyle(
                  color: HexColor("#0D0E0E"),
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        // password input
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kata Sandi",
              style: TextStyle(
                  color: HexColor("#0D0E0E"),
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
        ),
        // re-password input
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Masukkan Ulang Kata Sandi",
              style: TextStyle(
                  color: HexColor("#0D0E0E"),
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            controller: rePasswordController,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
        ),
      ],
    );
  }

  Widget buttonDaftar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(
                Size(MediaQuery.of(context).size.width, 0)),
            backgroundColor: MaterialStatePropertyAll(HexColor("#A0EEFF"))),
        onPressed: () {
          print("click");
          if (namaController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Kolom Nama tidak boleh kosong!")));
          } else if (emailController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Kolom Email tidak boleh kosong!")));
          } else if (passwordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Kolom Password tidak boleh kosong!")));
          } else if (rePasswordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Kolom Re-Password tidak boleh kosong!")));
          } else if (passwordController.text != rePasswordController.text) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Password tidak sama!")));
          } else {
            registerMethod();
          }
        },
        child: Text(
          ' Daftar ',
          style: TextStyle(color: HexColor("#0D0E0E")),
        ),
      ),
    );
  }

  void registerMethod() {
    Map<String, dynamic> request = {
      'nama_user': namaController.text,
      'email_user': emailController.text,
      'password_user': passwordController.text
    };
    registerAPI(request).then((value) {
      if (value['statusCode'] == 422) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(value['errors']['email_user'][0])));
      } else if (value['statusCode'] == 201) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              title: "SUKSES",
              message: "Berhasil membuat akun",
              type: "success",
            );
          },
        );
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }),
          );
        });
      }
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
              title: "Gagal Register", message: error.toString(), type: "failed");
        },
      );
    });
  }
}
