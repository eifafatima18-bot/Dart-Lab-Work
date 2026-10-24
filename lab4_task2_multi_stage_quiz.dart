import 'package:flutter/material.dart';

void main()=>runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context)=>MaterialApp(debugShowCheckedModeBanner:false,
    initialRoute:'/',
    routes:{'/':(_)=>const HomePage(),
    '/quiz':(_)=>const QuizPage()});
}

const questions=['Flutter is developed by?',
  'Which language is used by Flutter?',
  'Which widget lays out children vertically?'];

const choices=[['Google',
    'Apple',
    'Microsoft'],
  ['Dart',
    'Java',
    'Python'],
  ['Row',
    'Column',
    'Stack']];

const correct=[0,
  0,
  1];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Quiz Home')),
    body:Center(child:ElevatedButton(onPressed:()=>Navigator.pushNamed(context,
          '/quiz'),
        child:const Text('Start Quiz'))));
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState()=>_QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final answers=<int?>[null,
    null,
    null];

  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Quiz')),
    body:ListView(padding:const EdgeInsets.all(16),
      children:[for(int i=0;
          i<questions.length;
          i++)Column(crossAxisAlignment:CrossAxisAlignment.start,
          children:[Text('${i+1}. ${questions[i]}'),
            for(int j=0;
              j<choices[i].length;
              j++)RadioListTile<int>(title:Text(choices[i][j]),
              value:j,
              groupValue:answers[i],
              onChanged:(v)=>setState(()=>answers[i]=v)),
            const Divider()]),
        ElevatedButton(onPressed:answers.contains(null)?null:()=>Navigator.push(context,
            MaterialPageRoute(builder:(_)=>ReviewPage(answers:List<int>.from(answers.cast<int>())))),
          child:const Text('Review Answers'))]));
}

class ReviewPage extends StatelessWidget {
  final List<int> answers;
  const ReviewPage({super.key,
    required this.answers});

  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Review Answers')),
    body:ListView(padding:const EdgeInsets.all(16),
      children:[for(int i=0;
          i<answers.length;
          i++)ListTile(title:Text(questions[i]),
          subtitle:Text(choices[i][answers[i]])),
        ElevatedButton(onPressed:()=>Navigator.pop(context),
          child:const Text('Change Answers')),
        ElevatedButton(onPressed:()=>Navigator.push(context,
            MaterialPageRoute(builder:(_)=>ResultsPage(answers:answers))),
          child:const Text('Submit'))]));
}

class ResultsPage extends StatelessWidget {
  final List<int> answers;
  const ResultsPage({super.key,
    required this.answers});

  @override
  Widget build(BuildContext context) {
    final score=List.generate(answers.length,
      (i)=>answers[i]==correct[i]).where((v)=>v).length;
    return Scaffold(appBar:AppBar(title:const Text('Results')),
      body:Center(child:Text('Your score: $score / ${answers.length}',
          style:Theme.of(context).textTheme.headlineMedium)));
  }
}
