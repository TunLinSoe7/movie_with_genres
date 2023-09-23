import 'package:json_annotation/json_annotation.dart';
import 'package:movie_with_genres/vos/movie_vo.dart';
part 'movie_response.g.dart';
@JsonSerializable()
class MovieResponse {

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<MovieVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  MovieResponse(
      {
        this.page,
        this.results,
        this.totalPages,
        this.totalResults});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
