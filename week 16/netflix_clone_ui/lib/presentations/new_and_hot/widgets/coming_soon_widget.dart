import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_ui/presentations/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
   
  });

 

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Row(
      children: [
      const  SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('FEB',
              style: TextStyle(fontSize: 16,
              color: greyColor
            ),
              ),
              Text('11',style: 
              TextStyle(fontSize: 25,
              letterSpacing: 4,
              fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        SizedBox(
          width: size.width-50,
          height: 450,
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
            Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TALL GIRL 2",
                  style: TextStyle(fontSize: 35,
                  letterSpacing: -5,
                  fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButton(icon: Icons.notification_add_outlined,
                       title: "Remind me",
                      iconSize:12 ,textSize:10 ,
    
                      ),
                      constantWidth,
                       CustomButton(icon: Icons.info_outline_rounded,
                       title: "Info",
                      iconSize:12 ,textSize:10 ,
    
                      ),
                      constantWidth
                    ],
                  )
                ],
              ),
              constantHeight,
             Text('Coming on Friday'),
              constantHeight,
              Text('Tall Girl 2',
              style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold,
             
              )
              ),
              constantHeight,
            Text('Landing the Lead in the school musical is a dream come true for jodi,until the pressure sends her confidence-add her confidence - and her relationship-into a tailspin',
              style: TextStyle(color: greyColor),
              )
            ],
          ),
          
        ),
      ],
    );
  }
}

