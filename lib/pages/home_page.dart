import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_with_genres/constant.dart';
import 'package:movie_with_genres/provider/home_page_provider.dart';
import 'package:movie_with_genres/vos/genre_vo.dart';
import 'package:movie_with_genres/vos/movie_vo.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>HomePageProvider(),
      child: Consumer<HomePageProvider>(
        builder: (_,provider,__){
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ///To Show GenreList in ListView
                  Selector<HomePageProvider,List<GenreVO>?>(builder: (_,genre,__){
                    return SizedBox(
                      height: 50,
                      child: genre==null|| genre.isEmpty?const Center(child: CircularProgressIndicator(),):ListView.builder(
                          itemCount: genre.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_,index){
                            final genreList = genre[index].isSelected;
                            return GestureDetector(
                              onTap: (){
                                provider.selectedGenre(genre[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                color: genreList!?Colors.red:Colors.blueGrey,
                                padding: const EdgeInsets.all(5),
                                child: Text("${genre[index].name}"),
                              ),
                            );
                          }),
                    );
                  }, selector: (_,provider)=>provider.getGenreList),
                  ///To Show MovieByGenreData in GridView
                  Selector<HomePageProvider,List<MovieVO>?>(builder: (_,movie,__){
                    return movie==null||movie.isEmpty?const Center(
                      child: CircularProgressIndicator(),
                    ):
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: movie.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8,
                            crossAxisCount: 2), itemBuilder: (_,index){
                      return GridItemView(title: "${movie[index].title}", imageUrl: "${movie[index].posterPath}");
                    });
                  }, selector: (_,provider)=>provider.getMovieList),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
///GridItemView
class GridItemView extends StatelessWidget {
  final String title;
  final String imageUrl;

  const GridItemView({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.blueGrey.withOpacity(0.15)
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              height: 140,
              width: MediaQuery.of(context).size.width,
              imageUrl: kPrefixImage+imageUrl,
              placeholder: (_,url)=>Icon(Icons.image),
              errorWidget: (_,url,__)=>CircularProgressIndicator(),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 5),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}