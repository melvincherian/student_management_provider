import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.image
  });
final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          
          height: 200,
          
          child: Image.network(imageBase+image,
          fit: BoxFit.cover,),
        ),
         Positioned(
          bottom: 0,
          right: 10,
           child: CircleAvatar(
                             radius: 22,
                             backgroundColor: Colors.black.withOpacity(0.5),
                             child: IconButton(onPressed: (){}, icon:const Icon(Icons.volume_off,
                             color: whiteColor,
                             size: 20,
                             )
                             )
                             ),
         ),
      ],
    );
  }
}