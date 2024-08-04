// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        constantWidth,
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        constantWidth,
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                'https://pbs.twimg.com/media/GB2vydcX0AAgt5f?format=png&name=360x360'),
            fit: BoxFit.cover,
          )),
          width: 30,
          height: 30,
        ),
        constantWidth,
      ],
    );
  }
}
