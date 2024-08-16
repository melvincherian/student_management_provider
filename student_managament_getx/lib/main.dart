import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managament_getx/controller/controller.dart';
import 'package:student_managament_getx/databasee/db_functions.dart';
import 'package:student_managament_getx/presentation/home/home.dart';

Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    Get.put(StudentController());

    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management',
      home: Homepage(),
    );
  
  }
}

