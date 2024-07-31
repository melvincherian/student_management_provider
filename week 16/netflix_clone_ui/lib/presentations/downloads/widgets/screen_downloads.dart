// ignore_for_file: unnecessary_import, prefer_const_constructors_in_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/widgets/app_bar.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  
  final _widgtetList=[
    const   _SmartDownloads(),
    Section2(),
  const  Section3(),
  ];


  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return  Scaffold(
      appBar:const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title:"Downloads" ,
        ),
      ),
      body:ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (context,index)=>_widgtetList[index],
        separatorBuilder: 
      (context,index)=>SizedBox(height:25),
      itemCount: _widgtetList.length,
      )
  
    );
  }
}

class Section2 extends StatelessWidget {
   Section2({super.key});

    final List imageList=[
  "https://media.themoviedb.org/t/p/w220_and_h330_face/8fYluTtB3b3HKO7KQa5tzrvGaps.jpg",
  "https://media.themoviedb.org/t/p/w220_and_h330_face/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
  "https://media.themoviedb.org/t/p/w220_and_h330_face/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg"
   
  ];

  @override
  Widget build(BuildContext context) {
      final Size size=MediaQuery.of(context).size;
    return  Column(
      children: [
         const   Text('Introducing Downloads for you ',
       textAlign: TextAlign.center,
       style: TextStyle(
        color: whiteColor,fontSize: 24,
        fontWeight: FontWeight.bold
       ),
       ),
       constantHeight,
       const   Text('We will download a personalised selection of\n movies and shows for you, so there is\n always something to watch on your\n device',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,

        ),
       ),
       constantHeight,
       SizedBox(
           width: size.width,
           height: size.width,
          //  color:Colors.white ,
           child: Stack(
            alignment:Alignment.center ,
            children: [
              CircleAvatar(
                radius:size.width *0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadImageWidget(imageList: imageList[0],
               margin: 
            const  EdgeInsets.only(left: 170,top: 50),
            angle: 25,
                      size: Size(size.width * 0.35,size. width *0.55),
           
            ),
            
              DownloadImageWidget(imageList: imageList[1],
               margin: 
           const   EdgeInsets.only(right: 170,top: 50),
           angle: -20,
                   size: Size(size.width * 0.35,size. width *0.55),
 
           ),
              DownloadImageWidget(imageList: imageList[2],
               radius: 8,
               margin: 
           const   EdgeInsets.only(bottom: 40,top: 50),
                     size: Size(size.width * 0.4,size. width *0.6)
           
           )
            ],
           ),
       ),
      ],
    );
  }
}


class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          width: double.infinity,
           child: MaterialButton(
              color: buttonColorblue,
              onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              child:const Padding(
                 padding:  EdgeInsets.symmetric(vertical:10 ),
                child:  Text('Setup',
                 style: TextStyle(color: buttonColorwhite,
                 fontSize: 20,
                 fontWeight: FontWeight.bold
                 ),
                ),
              ),),
         ),
         constantHeight,
            MaterialButton(
            color: whiteColor,
            onPressed: (){},
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            child:const Padding(
              padding:  EdgeInsets.symmetric(vertical:10 ),
              child:  Text('See what you can download',
               style: TextStyle(color: blackColor,
               fontSize: 20,
               fontWeight: FontWeight.bold
               ),
              ),
            ),)

      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const   Row(
         children: [
           Icon(Icons.settings,
           color: whiteColor,
           ),
            constantWidth,
           Text('Smart Downloads')
         ],
         
       );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    super.key,
   
    required this.imageList,
    this.angle=0,
    required this.margin,
    required this.size,
    this.radius=10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final Size size=MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle*pi/180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            // margin: margin,
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                fit:BoxFit.cover ,
                image: NetworkImage(imageList))
            ),
          ),
        ),
      ),
    );
  }
}