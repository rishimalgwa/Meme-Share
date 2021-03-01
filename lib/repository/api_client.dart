import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meme_app/models/meme_model.dart';

class MemeApiClient {
  static const baseUrl = 'https://meme-api.herokuapp.com/gimme';
  final http.Client httpClient;
  MemeApiClient({@required this.httpClient}) : assert(httpClient != null);
  Future<Meme> fetchMeme() async {
    final memeResponse = await this.httpClient.get(baseUrl);
    if (memeResponse.statusCode != 200) {
      throw 'Somthing went wrong';
    }
    final memeJson = jsonDecode(memeResponse.body);
    return Meme.fromJson(memeJson);
  }
}
