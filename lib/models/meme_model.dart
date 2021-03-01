import 'package:equatable/equatable.dart';

class Meme extends Equatable {
  final String url;
  final String postLink;
  final String subreddit;
  final String author;
  final int ups;

  Meme({this.url, this.postLink, this.subreddit, this.author, this.ups});

  @override
  List<Object> get props => [url, postLink, subreddit, author, ups];

  static Meme fromJson(dynamic json) {
    return Meme(
        author: json['author'],
        ups: json['ups'],
        url: json['url'],
        subreddit: json['subreddit'],
        postLink: json['postLink']);
  }
}
