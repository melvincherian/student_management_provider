// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/application/modelss/movie_model.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/search/widget/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w250_and_h141_face/fY3lD0jM5AoHJMunjGWqJ0hRteI.jpg";

class SearchIdleWidget extends StatelessWidget {
  final List<Movie> result;
  const SearchIdleWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        constantHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index < result.length) {
                return TopSearchItem(
                    nameMovie: result[index].title,
                    imageUrl: result[index].imagepath);
              } else {
                return const SizedBox.shrink();
              }
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
            itemCount: result.length,
          ),
        )
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  final String imageUrl;
  final String nameMovie;

  const TopSearchItem(
      {super.key, required this.imageUrl, required this.nameMovie});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageBase + imageUrl,
                  ))),
        ),
        Expanded(
            child: Text(
          nameMovie,
          style: const TextStyle(
              color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: whiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: blackColor,
            radius: 23,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: whiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
