
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BmiResult extends StatelessWidget {

  final int result ;
  final bool isMale ;
  final int age;


  BmiResult({required this.result, required this.isMale,required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.keyboard_arrow_left),onPressed: () {
          Navigator.pop(context);
        },),
        title: Text('Bmi caluclator ',style: TextStyle(fontSize:25 ,fontWeight: FontWeight.bold),)
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale ? 'male ': 'Female '} ',style: TextStyle(fontSize:20 ,fontWeight:FontWeight.bold ),),
            Text('Result :${result} ',style: TextStyle(fontSize:20 ,fontWeight:FontWeight.bold ),),
            Text('Age: ${age} ',style: TextStyle(fontSize:20 ,fontWeight:FontWeight.bold ),),



          ],
        ),
      ) ,

    );
  }
}
