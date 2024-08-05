import 'package:flutter/widgets.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/widgets/main_card.dart';
import 'package:netflix_clone_ui/presentations/widgets/main_title.dart';

class Maintitlecard extends StatelessWidget {
  const Maintitlecard({
    super.key,
    required this.title, 
    required this.movies,
  });

  final String title;
  final List movies;
   
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
               MainTitle(
                  title: title
                  ) ,
                  constantHeight,
                 LimitedBox(
                  maxHeight: 200,
                   child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: 
                      List.generate(movies.length, (index)=> HomeMainCard(image: movies[index].imagepath))
                   
                   ),
                 )
          ],
        ),
      ],
    );
  }
}
