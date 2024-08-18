import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_provider/core/constant.dart';
import 'package:student_management_provider/model/model.dart';
import 'package:student_management_provider/presentation/updates/screen_update.dart';
import 'package:student_management_provider/widgets/delete_dialog.dart';

class StudentDialog {
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
                          : const AssetImage('assets/defalult_avathar.png'),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ScreenUpdate(student: student)));
                        },
                        icon: const Icon(Icons.edit_note_outlined))
                  ],
                ),
                dailogeText('NAME: ${student.name}'),
                constantHeight10,
                dailogeText('AGE: ${student.age}'),
                constantHeight10,
                dailogeText('COURSE: ${student.course}'),
                constantHeight10,
                dailogeText('PLACE: ${student.place}'),
                constantHeight10,
                dailogeText('PHONE: ${student.phone}'),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {
                      DeleteDialog.deleteDailog(context, student);
                  }, icon: const Icon(Icons.delete),
                  color: Colors.red,
                  ),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child:const Text('Close'))
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
