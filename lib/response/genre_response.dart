import 'package:json_annotation/json_annotation.dart';
import '../vos/genre_vo.dart';
part 'genre_response.g.dart';
@JsonSerializable()
class GenresResponse {
  @JsonKey(name: 'genres')
  List<GenreVO>? genres;

  GenresResponse({this.genres});

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);
}