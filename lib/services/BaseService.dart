import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:app/config/cfg.dart';

Future<http.Response> httpGet(String resourcePath,
    {String id, Map<String, String> params, String extraPath}) async {
  try {
    var uri = Uri.https(
        Config.hostApi,
        Config.versionApi +
            resourcePath +
            (id != null && id != '' ? '/$id' : '') +
            (extraPath != null && extraPath != '' ? '$extraPath' : ''),
        params);
    final response = await http.get(uri, headers: {
    },).timeout(Duration(seconds: 100)).catchError((err){return http.Response("{}", 500);}).catchError((err){return http.Response("{}", 500);});

    return response;
  } on Exception {
    return http.Response("{}", 500);
  }
}

Future<http.Response> httpPost(
    String bodyJson, String resourcePath,) async {
  try {
    var uri = Uri.https(Config.hostApi, Config.versionApi + resourcePath);

    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: bodyJson).timeout(Duration(seconds: 100)).catchError((err){return http.Response("{}", 500);});
    return response;
  }catch (e){
    return http.Response("{}", 500);
  }
}

Future<http.Response> httpPut(String id, String bodyJson, String resourcePath) async {
  try {
    var uri = Uri.https(Config.hostApi, Config.versionApi + resourcePath + '/$id');
    final response = await http.put(uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: bodyJson).timeout(Duration(seconds: 10)).catchError((err){return http.Response("{}", 500);});
    return response;
  } catch (e) {
    return http.Response("{}", 500);
  }
}

Future<http.Response> httpDelete(String id, String customer,
    String authorization, String resourcePath, bool standardCall) async {
  try {
    var response;
    var uri = Uri.https(Config.hostApi, Config.versionApi + resourcePath + '/$id');

    var headers = {
    };

    if (standardCall) {
      response = await http.delete(uri, headers: headers).timeout(Duration(seconds: 10)).catchError((err){return http.Response("{}", 500);});
    } else {
      response = await http.get(uri, headers: headers).timeout(Duration(seconds: 10)).catchError((err){return http.Response("{}", 500);});
    }

    return response;
  } catch (e) {
    return http.Response("{}", 500);
  }
}
