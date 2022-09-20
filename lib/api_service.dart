import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/game_data_model.dart';

class APIService {
  Future<GameDataResponseModel> gameData() async {
    final url = Uri.https('api.igdb.com', '/v4/games');
    print(url);

    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'text/plain',
          'Client-ID': '9fn3q2les4vyoh0t3kl5bzeq361nzo',
          'Authorization': 'Bearer j0icjkjjjpt9jy8pl4h89hcc8vb8a1'
        },
        body: "fields *; where id = 1942;");
    print(response.statusCode);
    if (response.statusCode == 200) {
      return GameDataResponseModel.fromJson(json.decode(response.body));
    } else {
      throw CustomError(apiResponseCode: response.statusCode);
    }
  }
}

class CustomError implements Exception {
  int apiResponseCode;

  CustomError({required this.apiResponseCode});
}
