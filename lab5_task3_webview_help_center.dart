// Add webview_flutter to pubspec.yaml and configure platform permissions as required.

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

void main()=>runApp(const HelpApp());

class HelpApp extends StatelessWidget {
  const HelpApp({super.key});

  @override
  Widget build(BuildContext context)=>const MaterialApp(debugShowCheckedModeBanner:false,
    home:HelpScreen());
}

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState()=>_HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  late final WebViewController controller;
  bool loading=true;

  @override
  void initState() {
    super.initState();
    controller=WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..setNavigationDelegate(NavigationDelegate(onPageStarted:(_)=>setState(()=>loading=true),
        onPageFinished:(_)=>setState(()=>loading=false)))..loadRequest(Uri.parse('https://docs.flutter.dev'));
  }
  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Help Center'),
      actions:[IconButton(icon:const Icon(Icons.refresh),
          onPressed:()=>controller.reload()),
        IconButton(icon:const Icon(Icons.arrow_back),
          onPressed:()async{if(await controller.canGoBack())await controller.goBack();
          })]),
    body:Stack(children:[WebViewWidget(controller:controller),
        if(loading)const Center(child:CircularProgressIndicator())]));
}
