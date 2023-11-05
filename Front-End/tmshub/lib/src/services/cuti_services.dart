import 'dart:convert';
import 'package:tmshub/src/models/cuti_model.dart';
import 'package:tmshub/src/utils/globals.dart' as globals;

import 'package:http/http.dart' as http;

Future<List<CutiModel>> getCutiByUserAPI(int userId) async {
  final response =
      await http.get(Uri.parse('${globals.urlAPI}/cuti/${userId}'));

  final List<dynamic> jsonResponse = json.decode(response.body);
  final List<Map<String, dynamic>> jsonMap =
      jsonResponse.cast<Map<String, dynamic>>();

  if (response.statusCode == 200) {
    return jsonMap.map((e) => CutiModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load Cuti');
  }
}
