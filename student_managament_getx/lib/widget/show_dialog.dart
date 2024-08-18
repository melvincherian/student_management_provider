import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managament_getx/cores/colors.dart';

import 'package:student_managament_getx/model/model.dart';
import 'package:student_managament_getx/presentation/update/update.dart';
import 'package:student_managament_getx/widget/delete_dialog.dart';

class StudentDialogue {
  static void showStudentDialog(BuildContext context, StudentModel student) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(ScreenUpdate(student: student));
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 26,
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: student.image.isNotEmpty &&
                            File(student.image).existsSync()
                        ? FileImage(File(student.image))
                        : const AssetImage('assets/default_avatar.png')
                            as ImageProvider,
                  ),
                ),
                const SizedBox(height: 20),
                dialogText('Name:', student.name),
                const SizedBox(height: 10),
                dialogText('Age:', student.age),
                const SizedBox(height: 10),
                dialogText('Course:', student.course),
                const SizedBox(height: 10),
                dialogText('Place:', student.place),
                const SizedBox(height: 10),
                dialogText('Phone:', student.phone.toString()),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      DeleteDialog.deletedialog(context, student);
                    },
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text('Delete',
                    style: TextStyle(color: whitecolor),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  static Widget dialogText(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
