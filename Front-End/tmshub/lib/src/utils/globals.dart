// ignore_for_file: avoid_init_to_null

library globals;

import 'package:tmshub/src/models/pegawai_model.dart';
import 'package:tmshub/src/models/user_model.dart';

String urlAPI = 'http://192.168.0.103:8000/api';
// String urlAPI = 'http://172.168.101.166:8000/api';

// int userId = 0;

String locationNow = '';

double latitudeNow = 0.0;

double longtitudeNow = 0.0;

bool isLogin = false;

UserModel? userLogin = null;

PegawaiModel? pegawaiLogin = null;
