import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key,required this.image});
 
 final String image;
   
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10),
       width: 135,
      //  height: 250,


    decoration: BoxDecoration(
       borderRadius: constantRadius,
           image:DecorationImage(
               fit: BoxFit.cover,
              image: NetworkImage(
                     imageBase+image,
              ))),
    );
  }
}