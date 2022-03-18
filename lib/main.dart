import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int currentindex = 0;
  String Allresult='';
  final heightController=TextEditingController();
  final weightController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator BMI',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.black,
            iconSize: 40,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                radioButton('Man', Colors.blue, 0),
                radioButton('Woman', Colors.pink, 1),
              ],
            ),
            SizedBox(height: 20,),
            Text('Bo\'y sm da'),
            SizedBox(height: 5,),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Bo\'yingizni kiriting:',
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                )
              ),

            ),
            SizedBox(height: 20,),
            Text('Ves kg da'),
            SizedBox(height: 5,),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Vesingizni kiriting:',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  )
              ),

            ),
            SizedBox(height: 5,),
            Container(

              width: double.infinity,
              height: 40,
              child: TextButton(
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: (){
                 int h=int.parse(heightController.value.text);
                 int w=int.parse(weightController.value.text);
                 calculate(h, w);
                },
                child: Text('Hisobla!!!', style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: Text('Sizning MBIingiz:   ',
                style: TextStyle(fontSize: 19, color: Colors.black),
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: Text(Allresult,
                style: TextStyle(fontSize: 29, color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      child: TextButton(
        
        style: ButtonStyle(
          
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            backgroundColor: currentindex == index
                ? MaterialStateProperty.all(color)
                : MaterialStateProperty.all(Colors.black12)),
        onPressed: () {
          changeIndex(index);
        },
        child: Text(value,
        style: TextStyle(color: currentindex==index?Colors.white:Colors.black),),
      ),
    ));
  }

  void calculate(int height, int weight){


      double result=-1;
      setState(() {
        result=weight/(height*height/10000);
      });


    Allresult=result.toStringAsFixed(2);

  }
}
