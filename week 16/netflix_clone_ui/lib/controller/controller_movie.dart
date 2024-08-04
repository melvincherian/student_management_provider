// ignore_for_file: unused_field

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:netflix_clone_ui/application/modelss/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieServices{
  static const _apikey='7641fb4a59c62af98a9d9234b5b798bd';

  static const _baseurl='https://api.themoviedb.org/3/movie';

  static const _nowplaying=
  'https://api.themoviedb.org/3/movie/upcoming?api_key=$_apikey';

  static const  _popular= 
  'https://api.themoviedb.org/3/movie/now_playing?api_key=$_apikey';

  static const _upcoming=
  'https://api.themoviedb.org/3/movie/top_rated?api_key=$_apikey';


  static Future<List<Movie>>getNowplayingMovies()async{
    const int maxRetries=3;
    int count=0;

    while(count<maxRetries){
      try{
        final response=await http.get(Uri.parse(_nowplaying));
        if(response.statusCode==200){
          final List<dynamic>data=jsonDecode(response.body)['result'];

          return data.map((json)=>Movie.fromJson(json)).toList();
        }

      }catch(e){
        if(kDebugMode){
          print('Error fetching playing movies:$e');
        }
      }
      count++;
    }
    return [];
  }

  static Future<List<Movie>>getpopularMovies()async{
    int maxRetries=3;
    int count=0;

    while(count<maxRetries){
      try{
        final response= await http.get(Uri.parse(_popular));
        if(response.statusCode==200){
          final List<dynamic>data=jsonDecode(response.body)['results'];
          return data.map((json)=>Movie.fromJson(json)).toList();

        }
      }catch(e){
        if(kDebugMode){
          print('Error fetching playing movies:$e');
        }
      }
      count++;
    }
    return [];

  }

  static Future<List<Movie>>getupComingMovies()async{
    int maxRetries=3;
    int count=0;

    while(count<maxRetries){
      try{
        final response= await http.get(Uri.parse(_upcoming));
        if(response.statusCode==200){
          final List<dynamic>data=jsonDecode(response.body)['results'];
          return data.map((json)=>Movie.fromJson(json)).toList();

        }
      }catch(e){
        if(kDebugMode){
          print('Error fetching playing movies:$e');
        }
      }
      count++;
    }
    return [];

  }
  
}