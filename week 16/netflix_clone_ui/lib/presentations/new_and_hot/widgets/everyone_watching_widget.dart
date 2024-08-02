import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_ui/presentations/widgets/video_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  const EveryOneWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,      children: [
           constantHeight,
          Text('Friends',
              style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
             
              )
              ),
              constantHeight,
            Text('This hit sitcom follows merry misadvantages of six 20-something pals as they navigate the pitfalls of work,life and love in 1990s Manhattam',
              style: TextStyle(color: greyColor),
              ),
              constantHeight50,
              VideoWidget(),
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

