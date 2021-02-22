import 'package:QuizApp/answer.dart';
import 'package:QuizApp/question.dart';
import 'package:QuizApp/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>  runApp(MainApp());




class MainApp extends StatefulWidget{
  @override
State<MainApp> createState() => _MainAppState();

}

class _MainAppState extends State<MainApp>{
List question=[
  {'questiontext':'What\'s 1+1',
    'answertext':['1','2','3'],
    'correctanswer':'2',
  },
  {'questiontext':'Select Fruit whose color is red',
    'answertext':['apple','orange','pinapple'],
    'correctanswer':'apple',
  },
  {'questiontext':'What\'s your favorite color',
    'answertext':['black','dark black','ultra dark black'],
    'correctanswer':'black',
  }
 
];
int _incQuestion=0;
int _score=0;

 void _questionIncrement() {
    setState(() {
    
    _incQuestion++;
      
      if(_incQuestion==question.length){
        // _incQuestion=0;
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => Result(_score)));
        // Result(_score);
      }
    
  });
  }
  
@override
  
  Widget build(BuildContext context) {
    
  return MaterialApp(
home: Scaffold(
  appBar:AppBar(
    title:Text('Quiz App'),
    

  ),
  body: _incQuestion<question.length?Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      
   

      Question(question[_incQuestion]['questiontext'],),  
      
       ...(question[_incQuestion]['answertext'] as List<String>).map((answer){
            return Answers(_questionIncrement,answer);
          }).toList(),

      
     
    ],):Result(_score),  
  
      
    
      
         
        // Answers(_questionIncrement),
        // Answers(_questionIncrement),
        // Answers(_questionIncrement),
      
 
),
  );
  }
  

}