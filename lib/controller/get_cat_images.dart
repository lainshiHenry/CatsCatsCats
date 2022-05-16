import 'dart:convert';

import 'package:cats_cats_cats/model/class/cat.dart';
import 'package:cats_cats_cats/model/constants/api.dart';
import 'package:http/http.dart' as http;

// Future<http.Response> isAuthenticated = authenticateAPICall();
// String apiCallURL =
//     'https://api.thecatapi.com/v1/images/search?breed_ids=beng&include_breed=false';

String apiCallURL = 'https://api.thecatapi.com/v1/images/search?breed_ids=beng';

Future<http.Response> APICallToGetCatImage() {
  return http.get(Uri.parse(apiCallURL), headers: {"x-api-key": apiKey});
}

Future<Cat> getCatImage() async {
  Cat _result = Cat(name: 'Cat', url: '');

  http.Response _response = await APICallToGetCatImage();
  print('status Code: ' + _response.statusCode.toString());
  String _APIresponse = _response.body;

  List<dynamic> rawData = jsonDecode(_APIresponse);
  print(rawData);
  dynamic catImage = rawData[0];
  print(catImage.runtimeType);

  Cat _resultCat = Cat(
      name: 'Bengal', url: 'https://cdn2.thecatapi.com/images/bTo6m3PVg.jpg');

  _result = _resultCat;
  return _result;
  // print(_response);
}
