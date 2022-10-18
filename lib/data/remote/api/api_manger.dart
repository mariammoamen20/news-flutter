import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/data/remote/api/model/source_response.dart';

class ApiManger {
  static const String BASE_URL = 'newsapi.org';
  static const String API_KEY = '8606b4b05fdb4a99a3e944b172293a8a';

  static Future<SourceResponse> getNewsSource() async{
    var uri = Uri.https(
      BASE_URL,
      '/v2/top-headlines/sources',
      {'apiKey': API_KEY, 'category': 'sports'},
    );
    //1- response string
   var response =  await http.get(uri);

    //2- Parses the string and returns the resulting Json object.
   var json = jsonDecode(response.body);//convert it to map

    //3- parse json to data class
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }
}
