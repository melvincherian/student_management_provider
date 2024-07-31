import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/search/widget/title.dart';

const imageUrl="https://media.themoviedb.org/t/p/w220_and_h330_face/KoYWXbnYuS3b0GyQPkbuexlVK9.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
     const   SearchTextTitle(title: 'Movies & TV',
        ),
        constantHeight,
        Expanded(child: GridView.count(
          shrinkWrap: true,
          crossAxisCount:3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1/1.4,
          children: List.generate(20, (index){
            return const MainCard();
          }),
          ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imageUrl),
            fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(7)
          ),
    );
  }
}