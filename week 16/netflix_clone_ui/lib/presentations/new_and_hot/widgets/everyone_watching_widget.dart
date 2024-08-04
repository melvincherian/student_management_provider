import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/application/modelss/movie_model.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_ui/presentations/widgets/video_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
   EveryOneWatchingWidget({
    super.key,required this.movies,required this.index,required this.everyone
  });
 List movies;
 final int index;
 final Movie everyone;

  @override
  Widget build(BuildContext context) {
    return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,      children: [
           constantHeight,
          Text(everyone.title,
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
             
              )
              ),
              constantHeight,
            Text( everyone.overview,
              style: TextStyle(color: greyColor),
              ),
              constantHeight50,
              VideoWidget(image:movies[index].imagepath,),
              constantHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                      CustomButton   (icon: Icons.send,
                      title: "Share",
                      iconSize:25 ,
                      textSize:16,
    
                      ),
                      constantWidth,
                       CustomButton(icon: Icons.add,
                       title: "My List",
                      iconSize:25 ,
                      textSize:16,
    
                      ),
                      constantWidth,
                      CustomButton(icon: Icons.play_arrow,
                      title: "Play",
                      iconSize:25 ,
                      textSize:16,
    
                      ),
                      constantWidth
                ],
              )
      ],
    );
  }
}

