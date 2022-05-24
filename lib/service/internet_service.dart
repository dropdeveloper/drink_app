import 'dart:convert';
import 'dart:io';
import 'package:drink_app/utils/exception_handler.dart';
import 'package:http/http.dart' as http;

class InternetService {
  //https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum

  final _url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";

  Future<dynamic> getData({String searchKey = ""}) async {
    var url = Uri.parse(_url + searchKey);
    var responseJson;
    try {
      final response = await http.get(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

enum InternetResponse {
  LOADING,
  DONE,
  ERROR,
}

InternetService internetService = InternetService();
