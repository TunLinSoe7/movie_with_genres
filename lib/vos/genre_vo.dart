import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'genre_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: 1)
class GenreVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;
  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;
  @HiveField(2)
  bool? isSelected;

  GenreVO({this.id, this.name,this.isSelected=false});

  factory GenreVO.fromJson(Map<String, dynamic> json) =>_$GenreVOFromJson(json);
  }