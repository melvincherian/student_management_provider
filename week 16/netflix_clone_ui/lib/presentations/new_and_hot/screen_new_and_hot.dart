import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone_ui/presentations/new_and_hot/widgets/everyone_watching_widget.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:const Size.fromHeight(90),
          child: AppBar(
           title: Text(
          "New & Hot",
          
      style: GoogleFonts.montserrat(
       fontSize: 30,
       fontWeight:FontWeight.bold,
      ),
      ),
      actions: [
         const   Icon(Icons.cast,
          color: Colors.white,
          size: 30,
          ),
          constantWidth,
          Container(
            width: 30,
            height: 30,
            color:Colors.blue ,),
          constantWidth,
      ],
      bottom: TabBar(
        
        labelColor: blackColor,
        unselectedLabelColor: whiteColor,
        isScrollable: true,
        labelStyle:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
        indicator: BoxDecoration(
          color: whiteColor,
          borderRadius: constantRadius30,
        ),
        tabs:const [
         Tab(text: "🍿Coming Soon",),
         Tab(text: "👀 Everyone's Watching",)
      
      ]),
          )
          
        ),
        
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryoneWatching()

        ])
      ),
    );
  }
  
 Widget _buildComingSoon() {
  
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, index)=>const ComingSoonWidget() 
    
  
    
  );
 }
  
  _buildEveryoneWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context,index)=>const EveryOneWatchingWidget());
  }
  
}

