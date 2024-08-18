import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/presentation/home/home.dart';
import 'package:student_management_provider/provider/add_page_provider.dart';
import 'package:student_management_provider/provider/detail_page_provider.dart';
import 'package:student_management_provider/provider/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddPageProvider()),
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => StudentDetailProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenHome(),
      ),
    );
  }
}
