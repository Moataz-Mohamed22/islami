import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/core/EndPoints.dart';
import 'package:islami/core/api_Constants.dart';
import 'package:islami/model/Radio_model.dart';

class ApiManager {
  static Future<RadioModel?> getRadio() async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, EndPoints.sourceRadio, {"language": ApiConstants.language});
    try {
      var response = await http.get(url);
 return
 RadioModel.fromJson(jsonDecode(response.body));

    } catch (e) {
      throw e;
    }
  }
}
