import 'dart:async';
import 'package:movieapp_200327/model/Media.dart';
import 'package:movieapp_200327/common/HttpHandler.dart';
import 'package:movieapp_200327/model/Cast.dart';

abstract class MediaProvider{
  
  Future<List<Media>> fetchMedia(String category);
  Future<List<Cast>> fetchCast(int mediaId);

}

class MediaPrvider extends MediaProvider{
HttpHandler _client = HttpHandler.get();
@override
Future<List<Media>> fetchMedia( String category){
  return _client.fetchMovies(category : category );
}

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditMovies(mediaId);
  }
}

class ShowProvider extends MediaProvider{
HttpHandler _client = HttpHandler.get();
@override
Future<List<Media>> fetchMedia( String category){
  return _client.fetchShow(category: category);
}

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditShows(mediaId);
  }
}