import 'package:flutter/cupertino.dart';
import 'package:meme_app/models/meme_model.dart';
import 'package:meme_app/repository/api_client.dart';

class MemeRepository {
  final MemeApiClient memeApiClient;

  MemeRepository({@required this.memeApiClient})
      : assert(memeApiClient != null);
  Future<Meme> getMeme() {
    return memeApiClient.fetchMeme();
  }
}
