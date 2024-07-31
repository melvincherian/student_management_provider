import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/presentations/search/widget/search_result.dart';
import 'package:netflix_clone_ui/presentations/widgets/main_title.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
              MainTitle(
                title: 'Released in the Past Year') ,
               LimitedBox(
                maxHeight: 200,
                 child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: 
                    List.generate(10, (index)=>const MainCard())
                 
                 ),
               )
                // constantHeight,
                // Container(
                //   width: 150,
                //   height: 250,
               
                //   decoration: BoxDecoration(
                //     borderRadius: constantRadius,
                //     image:const DecorationImage(image: NetworkImage('https://media.themoviedb.org/t/p/w220_and_h330_face/7QMsOTMUswlwxJP0rTTZfmz2tX2.jpg'))),
                // )
        ],
      )
    );
  }
}

