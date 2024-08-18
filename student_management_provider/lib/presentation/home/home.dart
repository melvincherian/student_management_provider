// // ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, unused_element, deprecated_member_use

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:student_management_provider/core/colors.dart';
// import 'package:student_management_provider/core/constant.dart';
// import 'package:student_management_provider/presentation/addstudent/add_student.dart';
// import 'package:student_management_provider/presentation/search/search_page.dart';
// import 'package:student_management_provider/provider/home_provider.dart';
// import 'package:student_management_provider/widgets/show_dialog.dart';

// class ScreenHome extends StatelessWidget {
//   const ScreenHome({super.key});

//   Future<bool> _onwillpop(BuildContext, context) async {
//     return (await showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//                   title: const Text('Confirm Exit'),
//                   content: const Text('Do you want to exit the app?'),
//                   actions: <Widget>[
//                     TextButton(
//                         onPressed: () => Navigator.of(context).pop(false),
//                         child: const Text('No'))
//                   ],
//                 )) ??
//         false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final homeprovider = Provider.of<HomePageProvider>(context, listen: false);
//     homeprovider.refreshStudentList();
//     return WillPopScope(
//       onWillPop: () => _onwillpop(BuildContext, context),
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           title: const Text(
//             'Student Management App',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ScreenSearch()));
//                   },
//                   icon: const Icon(
//                     Icons.search,
//                     size: 28,
//                   )),
//             )
//           ],
//         ),
//         body: Consumer<HomePageProvider>(builder: (context, homeprovider, _) {
//           return ListView.separated(
//               separatorBuilder: (context, index) => constantHeight10,
//               itemCount: homeprovider.students.length,
//               itemBuilder: (context, index) {
//                 var student = homeprovider.students[index];

//                 return InkWell(
//                   onTap: () {
//                     StudentDialog.showStudentDialog(context, student);
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 16.0, vertical: 8.0),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                         color: backgroundcolor,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black,
//                             spreadRadius: 2,
//                             blurRadius: 10,
//                           )
//                         ]),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Container(
//                                 width: 120,
//                                 height: 120,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                   image: FileImage(File(student.image)),
//                                   fit: BoxFit.cover,
//                                 )),
//                               ),
//                             ),
//                             const SizedBox(width: 36),
//                             Expanded(
//                                 child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   student.name,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     color: whitecolor,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   'Course:${student.course}',
//                                   style: const TextStyle(color: whitecolor),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   'Age:${student.age}',
//                                   style: const TextStyle(
//                                       color: whitecolor, fontSize: 18),
//                                 )
//                               ],
//                             ))
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               });
//         }),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.blue,
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const AddStudent(),
//               ),
//             ).then(
//               (value) => homeprovider.refreshStudentList(),
//             );
//           },
//           child: const Icon(
//             Icons.add,
//             color: whitecolor,
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/presentation/addstudent/add_student.dart';
import 'package:student_management_provider/presentation/search/search_page.dart';
import 'package:student_management_provider/provider/home_provider.dart';
import 'package:student_management_provider/widgets/show_dialog.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  Future<bool> _onwillpop(BuildContext context) async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Confirm Exit'),
                  content: const Text('Do you want to exit the app?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No')),
                    TextButton(
                        onPressed: () => exit(0), child: const Text('Yes')),
                  ],
                ))) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomePageProvider>(context, listen: false);
    homeProvider.refreshStudentList();

    return WillPopScope(
      onWillPop: () => _onwillpop(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Student Management App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueAccent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenSearch(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Consumer<HomePageProvider>(
          builder: (context, homeProvider, _) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: homeProvider.students.length,
              itemBuilder: (context, index) {
                var student = homeProvider.students[index];

                return InkWell(
                  onTap: () {
                    StudentDialog.showStudentDialog(context, student);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 4,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(student.image)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Course: ${student.course}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Age: ${student.age}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddStudent(),
              ),
            ).then((value) => homeProvider.refreshStudentList());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
