import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {

  Future<dynamic> get(Uri url) async {
    var responseJson;
    try{
      final response = await http.get(url);
      responseJson = _returnResponse(response);
      debugPrint("Succ: '$responseJson");
    }catch(e){
      debugPrint("Error: '$e");
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response){
    switch(response.statusCode){
      case 200:
        var jsonResponse = json.decode(response.body.toString());
        return jsonResponse;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'An error occurred'
        );
    }
  }

}