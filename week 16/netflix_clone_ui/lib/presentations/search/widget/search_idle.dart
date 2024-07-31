import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/search/widget/title.dart';

  const imageUrl=
    "https://media.themoviedb.org/t/p/w250_and_h141_face/fY3lD0jM5AoHJMunjGWqJ0hRteI.jpg";

class SearchIdleWidget extends StatelessWidget {
const   SearchIdleWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    const    SearchTextTitle(title: 'Top Searches'),
             constantHeight,
       Expanded(
         child: ListView.separated(
              shrinkWrap: true,
          itemBuilder: (context,index)=>const TopSearchItem(),
         separatorBuilder:(context,index) => constantHeight20,
         itemCount: 10,),
       )
      ],
    );
  }
}



class TopSearchItem extends StatelessWidget {
  const TopSearchItem({super.key});

  @override
  Widget build(BuildContext context) {

   final screenWidth=MediaQuery.of(context).size.width;

    return  Row(
      children: [
        Container(
           width: screenWidth*0.35,
           height: 65,
          decoration:const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl))
          ),
        ),
    const    Expanded(child: Text('Movie Name',
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
        )),

   const    CircleAvatar(backgroundColor: whiteColor,
       radius: 25,
       child: CircleAvatar(
        backgroundColor: blackColor,
        radius: 23,
        child:Center(
          child: Icon(CupertinoIcons.play_fill,
          color: whiteColor,
          ),
        ) ,
       ),
       )
      ],
    );
  }
}