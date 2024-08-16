
// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:student_managament_getx/databasee/db_functions.dart';
// import 'package:student_managament_getx/model/model.dart';

// class StudentController extends GetxController{

// var students=<StudentModel>[].obs;
// var filterstudents=<StudentModel>[].obs;

// final nameEditingController=TextEditingController();
// final ageEditingController=TextEditingController();
// final placeEditingController=TextEditingController();
// final courseEditingController=TextEditingController();
// final phoneEditingController=TextEditingController();



// @override
//   void onInit() {
//     super.onInit();
//     fetchAllstudents();
//   }

// }

// Future<void>fetchAllstudents()async{

// try{
//   final fetchedstudents=await getAllStudents();
//   students.assignAll(fetchedstudents) ;
//   filteredStudents.assignAll(fetchedstudents);
// }catch(e){
//   if(kDebugMode){
//     print('Error fetching students $e');
//   }
// }

// }

// Future<void>addStudent(StudentModel student)async{
//   try{
//     await addStudent(student);
//     fetchAllstudents();
//   }catch(e){
//    if(kDebugMode){
//      print('Error fetching students$e');
//    }
//   }
// }

// Future<void>updateStudent(StudentModel student)async{
//  try{
//   await updateStudent(student);
//   fetchAllstudents();
//  }catch(e){
//   if(kDebugMode){
//     print('Error fetching updating data $e');
//   }
//  }

// }


// Future<void>deleteStudent(StudentModel studentId)async{
//   try{
//     await deleteStudent(studentId);
//     fetchAllstudents();
//   }catch(e){
//     if(kDebugMode){
//       print('Error when deleting student $e');
//     }
//   }
// }


// void search(String query){

// final lowercaseQuery=query.toLowerCase();
// if(lowercaseQuery.isEmpty){
//   filteredStudents.assignAll(students);

// }else{
//   filteredStudents.assignAll(students.where((student){
//     return student.name.toLowerCase().contains(lowercaseQuery);
//   }).toList());
// }

// }


// Future<String?>pickImage(ImageSource source)async{

// try{
//   final PickedFile=await ImagePicker().pickImage(source: source);
//   if(PickedFile!=null){
//     return PickedFile.path;
//   }
//   return null;
// }catch(e){
//   if(kDebugMode){
//     print('Image picking error $e');
//   }
//   return null;
// }


// }
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_managament_getx/databasee/db_functions.dart';
import 'package:student_managament_getx/model/model.dart';

class StudentController extends GetxController{

  var students = <StudentModel>[].obs;
  var filteredStudents = <StudentModel>[].obs;

  final nameEditingController = TextEditingController();
  final ageEditingController = TextEditingController();
  final placeEditingController = TextEditingController();
  final courseEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAllStudents();
  }

  Future<void> fetchAllStudents() async {
    try {
      final fetchedStudents = await getAllStudents(); 
      students.assignAll(fetchedStudents);
      filteredStudents.assignAll(fetchedStudents);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching students $e');
      }
    }
  }

  Future<void> insertStudent(StudentModel student) async {
    try {
      await addStudent(student);
      fetchAllStudents();
    } catch (e) {
      if (kDebugMode) {
        print('Error adding student $e');
      }
    }
  }

  Future<void> updateStudentData(StudentModel student) async {
    try {
      await updateStudent(student);
      fetchAllStudents();
    } catch (e) {
      if (kDebugMode) {
        print('Error updating student $e');
      }
    }
  }

  Future<void> deleteStudent(StudentModel student) async {
    try {
      await deleteStudent(student);
      fetchAllStudents();
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting student $e');
      }
    }
  }

  void search(String query) {
    final lowercaseQuery = query.toLowerCase();
    if (lowercaseQuery.isEmpty) {
      filteredStudents.assignAll(students);
    } else {
      filteredStudents.assignAll(
        students.where((student) {
          return student.name.toLowerCase().contains(lowercaseQuery);
        }).toList(),
      );
    }
  }

  Future<String?> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        return pickedFile.path;
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Image picking error $e');
      }
      return null;
    }
  }
}
