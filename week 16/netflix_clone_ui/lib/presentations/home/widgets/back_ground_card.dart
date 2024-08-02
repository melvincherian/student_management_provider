import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/custom_button_widget.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                
                decoration:const BoxDecoration(image: DecorationImage(image: NetworkImage(homemainimage,))) ,
              ),
           const   Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                         CustomButton(title: "My List",
                         icon: Icons.add,
                         ),
                         
                          _PlayButton(),
                          CustomButton(icon: Icons.info, title: "Info")
                          
                    ],
                  ),
                ),
              )
            ],
          );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      
      onPressed: (){},
    style:const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(whiteColor)
    ),
    icon:const Icon(Icons.play_arrow,
    size:25 ,
    color: blackColor,
    ),
     label:const Padding(
       padding:  EdgeInsets.symmetric(horizontal: 10),
       child: Text("Play",
      style: TextStyle(fontSize: 20,
      color: blackColor
      ),
      ),
     ));
  }
}

