import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/model/model.dart';
import 'package:student_management_provider/presentation/home/home.dart';
import 'package:student_management_provider/provider/detail_page_provider.dart';

class DeleteDialog {
  static Future<dynamic> deleteDailog(
      BuildContext context, StudentModel student) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Delete',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Provider.of<StudentDetailProvider>(context, listen: false)
                      .deleteStudent(student.id!);
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ScreenHome()));
                },
                child: const Text(
                  'YES',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 15,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
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
