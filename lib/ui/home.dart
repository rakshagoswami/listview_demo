import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_demo/model/movie.dart';
class ListViewDemo extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies=[
    "URI",
    "Raazi",
    "Masaan",
    "Sanju",
    "Bhoot: Part 1",
    "Manmarziyaan",
    "Sadar Udham Singh",
    "Raman Raghav 2.0",
    "Reservoir Dogs",
    "Airplane!",
    "Up",
    "The Vampire Diaries  ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children:
                [movieImage(movieList[index].image),
                  movieCard(movieList[index], context)]);
//            return Card(
//              elevation: 6.5,
//              color: Colors.amberAccent,
//              child: ListTile(
//                leading: CircleAvatar(
//                  child: Container(
//                    width: 200,
//                    height: 200,
//                    decoration: BoxDecoration(
//                        image: DecorationImage(
//                            image: NetworkImage(movieList[index].image),
//                            fit: BoxFit.cover
//                        ),
//                        color: Colors.blue,
//                        borderRadius: BorderRadius.circular(25)
//                    ),
//                    child: Text("M"),
//                  ),
//                ),
//                trailing: Text("... ",
//                  style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 20
//                  ),),
////          trailing: CircleAvatar(
////            child: Container(
////              decoration: BoxDecoration(
////                color: Colors.blue,
////                borderRadius: BorderRadius.circular(25)
////              ),
////              child: Text("M"),
////            ),
////          ),
//                title: Text(movieList
//                    .elementAt(index)
//                    .title,
//                  style: TextStyle(
//                      color: Colors.black,
//                      fontStyle: FontStyle.italic,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 20.2
//                  ),
//                ),
//                subtitle: Text("${movieList
//                    .elementAt(index)
//                    .year}"),
//                onTap: () {
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (context) =>
//                      MovieDetails(movieName: movieList
//                          .elementAt(index)
//                          .title,
//                        movie: movieList.elementAt(index),)
//                  ));
//                },
//                //onTap: () => debugPrint("Movies Name: ${movies.elementAt(index)}"),
//              ),
//            );
          }),
    );
  }
    Widget movieCard(Movie movie, BuildContext context){
      return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 60),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            color: Colors.blueGrey.shade100,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,
              bottom: 8.0,
              left: 54.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:  MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                            fontStyle: FontStyle.italic
                          ) ,
                        ),
                        Text(movie.year,
                        style: TextStyle(
                          fontSize: 18
                        )
                          ,)
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("IMDB Rating:-",
                        style: TextStyle(
                          fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        Text(movie.rating,
                        style: TextStyle(
                          fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        Text(movie.time,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ])
                  ],),
              ),
            ),
          ),
        ),
          onTap: () => {
          Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      MovieDetails(movieName: movie.title,
                        movie: movie,
                      )
          ))
                },);
          }
          Widget movieImage(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imageUrl ?? 'https://picsum.photos/200/300'),
        fit: BoxFit.cover
        )
      ),
    );
          }
      }















//new route (activity)
 class MovieDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieDetails({Key key, this.movieName, this.movie}) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Movies "),
         backgroundColor: Colors.deepPurpleAccent,
       ),

      body:  ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.image,),
          MovieWithPoster( movie: movie,),
          HorizontalLine(),
          MovieCast(movie: movie,),
          HorizontalLine()
        ],
      ),
//       body: Center(
//         child: Container(
//           child: RaisedButton(
//             child: Text("Go Back..! ${this.movieName}",
//                 style: TextStyle(
//                   fontStyle: FontStyle.italic,
//                     fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//             ),
//               onPressed: (){
//                  Navigator.pop(context, MaterialPage(builder: (context)=>ListViewDemo()));               }),
//         ),
//       ),
     );
   }
 }
    class MovieDetailsThumbnail extends StatelessWidget {
      final String thumbnail;
      const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
      @override
      Widget build(BuildContext context) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(thumbnail),
                          fit: BoxFit.cover)
                  ),
                ),
                (Icon(Icons.play_circle_outline, size: 100,
                  color: Colors.white,
                ))
              ],),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
//                gradient: LinearGradient(colors: [Colors.blue,Colors.deepOrangeAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                ),
              ),
              height: 80,
            )
          ],);
      }
    }
    class MovieWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieWithPoster({Key key, this.movie}) : super(key: key);
      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              MoviePoster(poster: movie.poster.toString()),
              SizedBox(width: 10,),
              Expanded(child: MovieDetailsHeader(movie: movie))
            ],),
        );
      }
    }


class MoviePoster extends StatelessWidget {
   final String poster;
  const MoviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width:MediaQuery.of(context).size.width/3,
          height: 200,
          decoration:BoxDecoration( image: DecorationImage(image: NetworkImage(poster),
          fit: BoxFit.cover)),
        ),
      ),

    );
  }
}



class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${movie.year} . ${movie.time} . Rating:  ${movie.rating}/10",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.orangeAccent

        ),),
        Text("${movie.title}"   ,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontStyle: FontStyle.normal,
              color: Colors.black
          ),),
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300
        ),
        children: <TextSpan>[
          TextSpan(
            text: movie.story,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400
            )
          ),
          TextSpan(
            text: "More...",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade800
            )
          )
        ]

        )
        )],
    );
  }
}
class MovieCast extends StatelessWidget {
  final Movie movie;

  const MovieCast({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieField(field: "Cast", value: movie.cast),
        MovieField(field:"director" , value: movie.director)
      ],
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text("$field: ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
                fontWeight: FontWeight.w300
            ),),
        Expanded(
          child: Text(value,
              style: TextStyle(
              color: Colors.black,
             fontSize: 16,
             fontWeight: FontWeight.w400)),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0  ),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}



