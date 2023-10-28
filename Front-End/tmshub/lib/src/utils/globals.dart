// ignore_for_file: avoid_init_to_null

library globals;

import 'package:tmshub/src/models/user_model.dart';

// String urlAPI = 'http://192.168.0.103:8000/api';
String urlAPI = 'http://10.1.78.243:8000/api';

int userId = 0;

String locationNow = '';

double latitudeNow = 0.0;

double longtitudeNow = 0.0;

bool isLogin = false;

UserModel? userLogin = null;
