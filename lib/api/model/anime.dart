import 'package:json_annotation/json_annotation.dart';

part 'anime.g.dart';

@JsonSerializable()
class Anime {
  int id;
  String name;
  String author;
  List<String> tags;
  String release;
  double score;
  String introduction;
  String cover;
  List<String> poster;

  Anime(
    this.id,
    this.author,
    this.cover,
    this.name,
    this.tags,
    this.score,
    this.release,
    this.introduction,
    this.poster,
  );

  factory Anime.fromJson(Map<String, dynamic> jsonData) =>
      _$AnimeFromJson(jsonData);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}
