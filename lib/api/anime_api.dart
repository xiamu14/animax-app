import 'package:animax/api/dio_client.dart';
import 'package:animax/api/model/anime.dart';

final dioClient = DioClient();

class AnimeApi {
  static Future<Anime> getAnimePopular() async {
    var response = await dioClient.get('/anime/popular');

    Anime result = Anime.fromJson(response.data);

    return result;
  }
}
