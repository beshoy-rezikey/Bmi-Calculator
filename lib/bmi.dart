
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:project/bmi_result.dart';

class Bmi extends StatefulWidget {
  Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
 bool ismale = true;
 double height = 120 ;
 int age = 20;
 int weight =80;
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          )),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          ismale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('images/male.png'),
                            height: 90,
                             width:90 ,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Male',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ismale ? Colors.blue : Colors. grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale= false ;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('images/female.png'),
                              height: 90,
                              width:90 ,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('',),
                            Text('Female',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ismale ? Colors.grey : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w900)),
                        SizedBox(
                          height: 20,
                        ),
                        Text('CM',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900)),
                      ],
                    ),
                    Slider(
                      value: height,
                      min: 80,
                      max: 220,
                      onChanged: (value) {
                        print(value.round());
                        setState(() {
                          height= value;
                        });
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Text('${age}',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            FloatingActionButton(

                              onPressed: () {
                                setState(() {});
                                if (age ==20 )return;
                                age --;

                              },
                              heroTag: 'age--',
                              child: Icon(Icons.remove),
                              mini: true,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {});
                                if (age ==60 )return;
                                age ++;
                              },
                              heroTag: 'age++',
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Text('${weight}',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {

                                });
                                if (weight==65) return;
                                weight --;
                              },
                              heroTag: 'Weight --',
                              child: Icon(Icons.remove),
                              mini: true,
                            ),
                            FloatingActionButton(

                              onPressed: () {
                                setState(() {

                                });
                                if (weight==150) return;
                                weight++;
                              },
                              heroTag: 'weight ++',
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.pinkAccent,
            height: 50,
            child: MaterialButton(


              onPressed: () {
               double result = weight /pow(height /100,2 );
               print('${result.round()}');

               Navigator.push(context, MaterialPageRoute(builder: (context) => BmiResult(age:age,isMale: ismale,result:result.round(),),));
              //  calculate();
              },
              child: Text(
                'Caluclate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void calculate (){
  double we = 0;
  if (ismale){
    we =48+1.1*(height-150);
  }
  else{
    we =45+.9*(height-150);

  }

 double TotalResult = we /weight*100;
 print(TotalResult);

  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('AlertDialog '),
      content:  Text('precnet : ${TotalResult.toInt()}%'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
}
