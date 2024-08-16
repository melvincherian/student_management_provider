import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managament_getx/databasee/db_functions.dart';
import 'package:student_managament_getx/model/model.dart';
import 'package:student_managament_getx/presentation/home/home.dart';

class DeleteDialog {
  static Future<dynamic> deletedialog(
      BuildContext context, StudentModel student) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete'),
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 238, 43, 43),
                fontSize: 20,
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold),
            actions: [
              TextButton(
                  onPressed: () {
                    // deleteStudent(student.id);
                    deleteStudent(student.id);
                    Get.back();
                    Get.to(const Homepage());
                  },
                  child: const Text(
                    'YES',
                    style: TextStyle(fontFamily: 'poppins,', fontSize: 15),
                  )),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'NO',
                    style: TextStyle(fontFamily: 'poppins', fontSize: 15),
                  ))
            ],
          );
        });
  }
}
