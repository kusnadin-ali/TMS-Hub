// ignore_for_file: unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:tmshub/src/utils/globals.dart' as globals;

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getPegawaiAPI(int userId) async {
  final response =
      await http.get(Uri.parse(globals.urlAPI + '/pegawai/${userId}'));

  if (response.statusCode == 200 || response.statusCode == 404) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    jsonResponse['statusCode'] = response.statusCode;
    return jsonResponse;
  } else {
    throw Exception('Failed to load Pegawai');
  }
}
