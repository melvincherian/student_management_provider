import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/application/modelss/movie_model.dart';
import 'package:netflix_clone_ui/controller/controller_movie.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/search/widget/search_idle.dart';
import 'package:netflix_clone_ui/presentations/search/widget/search_result.dart';
// import 'package:netflix_clone_ui/presentations/search/widget/search_result.dart';


class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final controller=TextEditingController();
  
  List<Movie>popular=[];
  List<Movie>searchResults=[];
  bool istapped=true;

Future getPopular()async{
  if(mounted){
    popular =await MovieServices.getpopularMovies();
    setState(() {
      
    });
  }
 
}
 _onSearchChanges() async {
    if (controller.text.isEmpty) {
      setState(() {
        istapped = true;
        searchResults.clear();
      });
    } else {
      await _fetchdatafromserver(controller.text);
    }
  }


 Future _fetchdatafromserver(String query)async{
  List<Movie>result=await searchfunction(query);
  setState(() {
    istapped=false;
    searchResults=result;
  });
 }

 @override
  void initState() {
    if(mounted){
      getPopular();
      controller.text='';
      
      super.initState();
      controller.addListener(_onSearchChanges);
      getPopular();
    }
   
  }

 @override
  void dispose() {
    controller.removeListener(_onSearchChanges);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Padding(
        padding:const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {
                setState(() {
                  value.isEmpty ?istapped=true:istapped=false;
                  _fetchdatafromserver(value);
                });
              },

              backgroundColor: Colors.grey.withOpacity(.4),
              prefixIcon:const Icon(
                CupertinoIcons.search,
                color: greyColor,
              ),
              suffixIcon:const Icon(
                CupertinoIcons.xmark_circle_fill,
                color:greyColor,
              ),
              style:const TextStyle(color:whiteColor),
              // backgroundColor: Color.fromARGB(255, 60, 60, 60),
              // prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
              // suffixIcon: Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
              // style: TextStyle(
              // color: whiteColor
              // ),
            ),
          
            constantHeight,
            _isEmpty(controller.text),
              // Expanded(child: SearchIdleWidget()),
              //  Expanded(child: SearchResultWidget()),
        
          ],
        ),
      ))
    );
  }
    Widget _isEmpty(String value) {
    return istapped
        ? Expanded(
            child: SearchIdleWidget(
            result: popular.isNotEmpty ? popular : [],
          ))
        : Expanded(
            child: SearchResultWidget(
            result: searchResults,
          ));
  }
}





   Future<List<Movie>> searchfunction(String query) async {
    const apiKey = '7641fb4a59c62af98a9d9234b5b798bd';
    const baseUrl = 'https://api.themoviedb.org/3/search/movie';

    int maxtries = 3;
    int mintries = 0;
    while (maxtries > mintries) {
      try {
        final response =
           await http.get(Uri.parse('$baseUrl?api_key=$apiKey&query=$query'));
          
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];

          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error in fetching the data');
        }
      }
      mintries++;
    }
    return [];
  }
