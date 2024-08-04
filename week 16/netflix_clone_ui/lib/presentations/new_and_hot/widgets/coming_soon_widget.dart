import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/application/modelss/movie_model.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';
// import 'package:netflix_clone_ui/application/modelss/movie_model.dart';
// import 'package:netflix_clone_ui/cores/colors/colors.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone_ui/presentations/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({
    super.key,
    required this.movies,
    required this.index,
    required this.coming,
  });

  List movies;
  final int index;
  final Movie coming;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                coming.releasedate,
                style:
                    TextStyle(fontSize: 18, color: whiteColor.withOpacity(0.5)),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                image: movies[index].imagepath,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Allow title to span maximum of 2 lines
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: size.width * 0.6, // Adjust width as needed
                        ),
                        child: Text(
                          coming.title,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButton(
                        icon: Icons.circle_notifications,
                        title: "Remind me",
                        iconSize: 12,
                        textSize: 10,
                      ),
                      constantWidth,
                      CustomButton(
                        icon: Icons.info_outline_rounded,
                        title: 'info',
                        iconSize: 20,
                        textSize: 12,
                      ),
                    ],
                  )
                ],
              ),

              constantHeight,
          const    Text('Coming on Friday'),
              constantHeight,
              Text(
                coming.overview,
                style:const TextStyle(color: greyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
