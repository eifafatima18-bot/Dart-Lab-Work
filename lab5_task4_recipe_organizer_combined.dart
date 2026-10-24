import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

void main()=>runApp(const OrganizerApp());

class OrganizerApp extends StatelessWidget {
  const OrganizerApp({super.key});

  @override
  Widget build(BuildContext context)=>MaterialApp(debugShowCheckedModeBanner:false,
    initialRoute:'/',
    routes:{'/':(_)=>const OrganizerHome(),
    '/help':(_)=>const HelpPage()});
}

class OrganizerHome extends StatelessWidget {
  const OrganizerHome({super.key});
  final recipes=const ['Pancakes',
    'Pasta',
    'Soup'];

  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Recipe Organizer'),
      actions:[IconButton(onPressed:()=>Navigator.pushNamed(context,
            '/help'),
          icon:const Icon(Icons.help_outline))]),
    body:ListView(children:[for(final recipe in recipes)ListTile(title:Text(recipe),
          leading:Hero(tag:recipe,
            child:const Icon(Icons.restaurant,
              size:40)),
          onTap:()=>Navigator.push(context,
            MaterialPageRoute(builder:(_)=>RecipePage(recipe:recipe))))]));
}

class RecipePage extends StatelessWidget {
  final String recipe;
  const RecipePage({super.key,
    required this.recipe});

  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:Text(recipe)),
    body:Center(child:Hero(tag:recipe,
        child:Column(mainAxisSize:MainAxisSize.min,
          children:[const Icon(Icons.restaurant,
              size:100),
            Text(recipe,
              style:Theme.of(context).textTheme.headlineMedium)]))));
}

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState()=>_HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  late final WebViewController controller;
  bool loading=true;

  @override
  void initState() {
    super.initState();
    controller=WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..setNavigationDelegate(NavigationDelegate(onPageStarted:(_)=>setState(()=>loading=true),
        onPageFinished:(_)=>setState(()=>loading=false)))..loadRequest(Uri.parse('https://docs.flutter.dev'));
  }
  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Help'),
      actions:[IconButton(onPressed:()=>controller.reload(),
          icon:const Icon(Icons.refresh)),
        IconButton(onPressed:()async{if(await controller.canGoBack())await controller.goBack();
          },
          icon:const Icon(Icons.arrow_back))]),
    body:Stack(children:[WebViewWidget(controller:controller),
        if(loading)const Center(child:CircularProgressIndicator())]));
}
