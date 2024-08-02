import 'package:flutter/widgets.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize=30,
    this.textSize=18
  });

 final IconData icon;
 final String title;
 final double iconSize;
 final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         Icon(icon,
         color: whiteColor,
         size: 30,
         ),
         Text(title,
         style: TextStyle(
           fontSize: textSize,
          
         ),
         )
       ],
    );
  }
}