import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managament_getx/cores/constant.dart';
import 'package:student_managament_getx/model/model.dart';
import 'package:student_managament_getx/presentation/update/update.dart';
import 'package:student_managament_getx/widget/delete_dialog.dart';

class StudentDialogue {
  static void showStudentDialog(BuildContext context, StudentModel student) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: student.image.isNotEmpty &&
                              File(student.image).existsSync()
                          ? FileImage(File(student.image))
                          : const AssetImage('assets/defalult_avathar.png')
                              as ImageProvider,
                    ),
                    IconButton(
                        onPressed: () {
                          Get.to(ScreenUpdate(
                            student: student,
                          ));
                        },
                        icon: const Icon(
                          Icons.edit_note,
                          size: 30,
                        ))
                  ],
                ),
                dailogeText('NAME:${student.name}'),
                constantheigtht10,
                dailogeText('AGE:${student.age}'),
                constantheigtht10,
                dailogeText('COURSE:${student.course}'),
                constantheigtht10,
                dailogeText('PLACE:${student.place}'),
                constantheigtht10,
                dailogeText('PHONE:${student.phone}')
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        DeleteDialog.deletedialog(
                          context,
                          student,
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Close'))
                ],
              )
            ],
          );
        });
  }

  static Text dailogeText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
