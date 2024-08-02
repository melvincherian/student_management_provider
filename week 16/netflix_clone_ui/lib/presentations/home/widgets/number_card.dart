import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
// import 'package:flutter/widgets.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key,required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
         const   SizedBox(
                 width: 40,
                 height: 200,
            ),
            Container(
             
               width: 130,
               height: 200,
                       
                          decoration: BoxDecoration(
                            borderRadius: constantRadius,
                            image:const DecorationImage(
                              fit: BoxFit.cover,
                      image: NetworkImage('https://media.themoviedb.org/t/p/w220_and_h330_face/yrpPYKijwdMHyTGIOd1iK1h0Xno.jpg'))),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -30,
          child: BorderedText(
            strokeColor: whiteColor,
            strokeWidth: 12.0,
            child: Text("${index+1}",
            style:const TextStyle(
            fontSize: 140,
            color: blackColor,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            decorationColor: Colors.black
            ),
            ),
          ),
        )
      ],
    );
    
  }
}