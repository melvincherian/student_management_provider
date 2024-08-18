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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            title: const Text(
              'Delete Student',
              style: TextStyle(
                  color: Color(0xFFD32F2F),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            content: const Text(
              'Are you sure you want to delete this student? This action cannot be undone.',
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  deleteStudent(student.id);
                  Get.back();
                  Get.to(const Homepage());
                },
                child: const Text(
                  'YES',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'NO',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
  }
}
