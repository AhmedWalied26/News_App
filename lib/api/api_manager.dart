import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/api_endpoint.dart';
import 'package:news_app/api/model/news_response/news_response.dart';
import 'package:news_app/api/model/source_response/source_response.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=3ace439389cd4bf9816a765ac62b92b0

class ApiManager {
  static Future<SourceResponse> getSources(
    String categoryId,
    String language,
  ) async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.sourceApi, {
        'apiKey': ApiConstant.apiKey,
        'category': categoryId,
        'language': language,
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

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=3ace439389cd4bf9816a765ac62b92b0

  static Future<NewsResponse> getNewsBySourceId(
    String sourceId,
    String language,
  ) async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiEndpoint.newsApi, {
        'apiKey': ApiConstant.apiKey,
        'sources': sourceId,
        'language': language,
      });

      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
