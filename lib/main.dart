import 'package:flutter/material.dart';
// import 'package:flutter_part1/question.dart';
// my own files
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  @override
  void answerQuestion() {
    setState(() => {questionIndex++});

    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // const is compile time
    const questions = [
      {
        'questionText': 'What\s your favorite color?',
        'answers': ['Black', 'Green, no blue!', 'Red']
      },
      {
        'questionText': 'What\s the capital of Assyria',
        'answers': ['I don\t know that', 'Aleppo', 'Jerusalem']
      },
      {
        'questionText': 'What is the airspeed velocity of an unladen swallow?',
        'answers': [
          'I don\t know!',
          'Too slow',
          'An African or a European swallow?'
        ]
      },
    ];


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Super Duper Personality App'),
        ),
        body: questionIndex< questions.length ? Column(
          children: [
            Question(questions[questionIndex]['questionText']),
            // means spread.  
            
            ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(answerQuestion, answer);
            }).toList()
          ],
        ) : Center(child: Text('You did it!'), ),
      ),
    );
  }
}
