import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/number_card.dart';
import 'package:netflix_clone_ui/presentations/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.movies,
  });
  final List movies;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
       const    MainTitle(
              title: "Top 10 Tv Shows In India Today"
              ) ,
              constantHeight,
             LimitedBox(
              maxHeight: 200,
               child: ListView(
                scrollDirection: Axis.horizontal,
                children: 
                  List.generate(10, (index)=> NumberCard(index: index,image: movies[index].imagepath))
               
               ),
             )
      ],
    );
  }
}