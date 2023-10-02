
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tmshub/src/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashboardScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
     decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft, // Atur titik awal gradient
          end: Alignment.topRight,    // Atur titik akhir gradient
          colors: [
            Color(0xFF2193B0),        // Warna gradient pertama
            Color(0xFFFFFFFF),        // Warna gradient kedua
          ],
          stops: [0.0, 0.5],      // Lokasi stop gradient (sesuai dengan CSS Anda)
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/logoEdit1.png',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

