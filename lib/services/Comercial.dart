
import 'dart:convert';

import 'package:app/models/ResponseModel.dart';

import 'BaseService.dart';

Future<ResponseModel> getAllConsultor(
    {String beginDate,String endDate,}) async {
  var resourcePath = '/consultor';
  ResponseModel response = new ResponseModel();

  var output =  await httpGet(resourcePath);

  response.body = output.body;
  response.statusCode = output.statusCode;

  return response;

}

Future<ResponseModel> getMount(
    String id) async {
  ResponseModel response = new ResponseModel();

  return response;
}
