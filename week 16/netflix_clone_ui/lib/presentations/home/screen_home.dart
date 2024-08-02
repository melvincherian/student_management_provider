import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/back_ground_card.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/number_title_card.dart';
import 'package:netflix_clone_ui/presentations/widgets/main_title_card.dart';


ValueNotifier<bool>scrollNotifier=ValueNotifier(true);


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ValueListenableBuilder(valueListenable: scrollNotifier, builder: (BuildContext context,index,_){
         return  NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction=notification.direction;
          print(direction);
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
              children:const [
                BackGroundCard(),
                Maintitlecard(
                title: "Released in the Past Year"),
                constantHeight,
            Maintitlecard(
                title: "Trending Now"),
                constantHeight,
              NumberTitleCard(),
                
             Maintitlecard(
              title: "Tense Dramas"),
              constantHeight,
             Maintitlecard(
             title: "South Indian Cinema"),
              constantHeight,      
              ],
            ),
        scrollNotifier.value==true ?  
         AnimatedContainer(
          duration: Duration(milliseconds: 1000),
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
          color:Colors.blue ,),
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






