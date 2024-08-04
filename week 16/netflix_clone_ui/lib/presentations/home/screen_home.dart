import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_ui/controller/controller_movie.dart';
// import 'package:netflix_clone_ui/controller/controller_movie.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/back_ground_card.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/number_title_card.dart';
import 'package:netflix_clone_ui/presentations/widgets/main_title_card.dart';


ValueNotifier<bool>scrollNotifier=ValueNotifier(true);


class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {

List nowplaying=[];
List toprated=[];
List popular=[];
List upcoming=[];
List clone=[];

Future getAllMovies()async{
  popular=await  MovieServices.getpopularMovies();
  nowplaying=await MovieServices.getNowplayingMovies();
  upcoming=await MovieServices.getupComingMovies();
  clone =await MovieServices.getNowplayingMovies();

  setState(() {
    
  });



}
@override
  void initState() {
    getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ValueListenableBuilder(valueListenable: scrollNotifier, builder: (BuildContext context,index,_){
         return  NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction=notification.direction;
          // print(direction);
          if(direction==ScrollDirection.reverse){
            scrollNotifier.value=false;
          }
          else if(direction==ScrollDirection.forward){
            scrollNotifier.value=true;
          }
          return true;
        },
        child: Stack(
          children: [
            ListView(
              children: [
             const   BackGroundCard(),
                Maintitlecard(
                title: "Released in the Past Year",
                movies:upcoming
                
                ),
                
                constantHeight,
            Maintitlecard(
                title: "Trending Now",
                movies: upcoming,
                ),
                
                constantHeight,
              NumberTitleCard(movies: upcoming,),
                
             Maintitlecard(
              title: "Tense Dramas",
              movies: upcoming,
              ),
              constantHeight,
             Maintitlecard(
             title: "South Indian Cinema",
             movies: upcoming,
             ),
              constantHeight,      
              ],
            ),
        scrollNotifier.value==true ?  
         AnimatedContainer(
          duration:const Duration(milliseconds: 1000),
              width: double.infinity,
              height: 90,
              color: Colors.black.withOpacity(0.3),
              child: Column(
                children: [
                  Row(
                    children: [
                      
                      Image.network("https://static.vecteezy.com/system/resources/previews/019/956/198/original/netflix-transparent-netflix-free-free-png.png",
                      width: 60,
                      height: 60,
                      ),
                     
                     const  Spacer(),
          const   Icon(Icons.cast,
        color: Colors.white,
        size: 30,
        ),
        constantWidth,
        Container(
          width: 30,
          height: 30,
          decoration:const BoxDecoration(
            image: DecorationImage(image: NetworkImage(
              'https://pbs.twimg.com/media/GB2vydcX0AAgt5f?format=png&name=360x360',
              
            ),
            fit: BoxFit.cover
            ),
            
          ),
          ),
        constantWidth,
                    ],
                  ),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('TV Shows',
                      style:constantHometitletext,
                      ),
                  
                      Text('Movies',
                      style:constantHometitletext ,
                      ),
                      Text('Categories',
                      style: constantHometitletext,
                      ),
                    ],
                  )
                ],
              ),
            ):constantHeight
          ],
        ),
      );
      },
     ),
    );
  }
}






