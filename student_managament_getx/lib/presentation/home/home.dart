// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managament_getx/controller/controller.dart';
import 'package:student_managament_getx/cores/colors.dart';
import 'package:student_managament_getx/cores/constant.dart';
import 'package:student_managament_getx/presentation/addpage/add_student.dart';
import 'package:student_managament_getx/presentation/search/search.dart';
import 'package:student_managament_getx/widget/show_dialog.dart';

final StudentController studentController=Get.put(StudentController());

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<bool>_onwillpop()async{
  return(await showDialog(
    context: context, 
  builder: (context)=>AlertDialog(
    title:const Text('Confirm Text'),
    content:const Text('Do you want to exit the app?'),
    actions:<Widget> [
      TextButton(onPressed: (){
        Navigator.of(context).pop(false);
      }, child:const  Text('No') 
      ),
      TextButton(onPressed: ()=>exit(0), 
      child:const Text('No'))
    ],

  ))??false
  );
 }
  @override
  Widget build(BuildContext context) {
  
     studentController.fetchAllStudents();
   
    
    return WillPopScope(
      onWillPop: _onwillpop,
      child: Scaffold(
        // backgroundColor: Colors.lime,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:const Text('Student Management App',
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23
        ),
        
        ),
        actions: [
          Padding(padding:const EdgeInsets.all(10),
          child: IconButton(onPressed: (){
            Get.to(const ScreenSearch());
          }, icon:const Icon(Icons.search,size: 26,)),
          )
        ],
      ),
      body: Obx(
       ()=>ListView.separated(
        separatorBuilder: (context,index)=>constantheigtht10,
         itemCount: studentController.students.length,
         itemBuilder: (context,index){
          var student=studentController.students[index];

          return InkWell(
            onTap: (){
              StudentDialogue.showStudentDialog(context, student);
            },
            child: Container(
              margin:const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              padding:const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundcolor,
                borderRadius: BorderRadius.circular(16),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    blurRadius: 10
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 123,
                        height: 123,
                        decoration: BoxDecoration(
                          image: DecorationImage(image:FileImage(File(student.image)),
                          fit: BoxFit.cover
                           )
                        ),
                      ),
                    ),
                  const  SizedBox(width: 35),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(student.name,
                        style:const TextStyle(fontSize: 24,
                        color: whitecolor,
                        fontWeight: FontWeight.bold,

                        ),

                        ),
                     const   SizedBox(height: 8),
                        Text('Course:${student.course}',
                        style:const TextStyle(
                          color: whitecolor,
                          fontSize: 18,

                        ),
                        ),
                    const    SizedBox(height: 4),
                        Text('Age:${student.age}',
                        style:const TextStyle(
                          color: whitecolor,
                          fontSize: 18
                        ),
                        )

                      ],
                    ))
                    
                  ],
                  ),
                 
                ],
              ),
            ),
            
          );
          
         }
         )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green, 
        onPressed: (){
        Get.to(()=>const AddStudent())?.then((value){
          studentController.fetchAllStudents();
        });
      },
      child:const Icon(Icons.add,
      color: whitecolor,
      ),
      ),
      
    ),
     
    
    );
    
  }
}