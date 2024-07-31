import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/search/widget/search_result.dart';


class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Color.fromARGB(255, 60, 60, 60),
              prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
              suffixIcon: Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
              style: TextStyle(
              color: whiteColor
              ),
            ),
            constantHeight,
            
              // Expanded(child: SearchIdleWidget()),
               Expanded(child: SearchResultWidget()),
        
          ],
        ),
      ))
    );
  }
}