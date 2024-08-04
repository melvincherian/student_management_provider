import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/application/modelss/movie_model.dart';
import 'package:netflix_clone_ui/controller/controller_movie.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone_ui/presentations/new_and_hot/widgets/everyone_watching_widget.dart';

class ScreenNewandHot extends StatefulWidget {
  const ScreenNewandHot({super.key});

  @override
  State<ScreenNewandHot> createState() => _ScreenNewandHotState();
}

class _ScreenNewandHotState extends State<ScreenNewandHot> {

List upcomingMovies=[];
List popularMovies=[];
bool isLoading=true;
bool isError=false;


Future<void>upComingMovies()async{
  try{
    List movies=await MovieServices.getupComingMovies();
    List popular=await MovieServices.getpopularMovies();


    if(mounted){
setState(() {
  upcomingMovies=movies;
  popularMovies=popular;
  isLoading=false;
});
    }
  }catch(e){
    if (kDebugMode) {
      print('Error fetching upcoming movies: $e');
    }
    if(mounted){
      setState(() {
        isError=true;
        isLoading=false;
      });
    }
  }
}
@override
void initState(){
  super.initState();
  upComingMovies();
}

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
    itemCount: upcomingMovies.length,
    itemBuilder: (BuildContext context, index)=> ComingSoonWidget(movies: upcomingMovies, index: index, coming: upcomingMovies[index],) 
    
  
    
  );
 }

  _buildEveryoneWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context,index)=> EveryOneWatchingWidget(movies:popularMovies, index: index, everyone: popularMovies[index],));
  }
}

