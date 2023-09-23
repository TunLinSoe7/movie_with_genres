import 'package:flutter/material.dart';
import 'package:movie_with_genres/constant.dart';
import 'package:movie_with_genres/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_with_genres/vos/genre_vo.dart';
import 'package:movie_with_genres/vos/movie_vo.dart';
void main()async{
  await Hive.initFlutter();
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  await Hive.openBox<GenreVO>(kBoxNameForGenre);
  await Hive.openBox<MovieVO>(kBoxNameForMovie);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
