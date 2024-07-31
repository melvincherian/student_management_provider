import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/presentations/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone_ui/presentations/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix_clone_ui/presentations/home/screen_home.dart';
import 'package:netflix_clone_ui/presentations/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone_ui/presentations/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone_ui/presentations/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});

  final _pages=[
    ScreenHome(),
    ScreenNewandHot(),
    ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownloads()
   
  ];
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor: backgroundColor,
     body: SafeArea(
       child: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder:(context,int index, _) {
         return _pages[index];
       },),
     ),

      
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}