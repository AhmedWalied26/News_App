import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/model/source_response/end_point.dart';
import 'package:news_app/api/model/source_response/source_response.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=3ace439389cd4bf9816a765ac62b92b0

class ApiManager {
  static Future<SourceResponse> getSources() async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, EndPoint.sourceApi, {
        'apiKey': ApiConstant.apiKey,
      });
      var response = await http.get(url);
      var resopnseBody = response.body;
      var json = jsonDecode(resopnseBody);
      return SourceResponse.fromJson(json);
      // SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
