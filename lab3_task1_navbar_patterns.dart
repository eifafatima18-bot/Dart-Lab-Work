import 'package:flutter/material.dart';

void main() => runApp(const Task1App());

class Task1App extends StatelessWidget {
  const Task1App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(debugShowCheckedModeBanner:false,
    home: MenuScreen());
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Task 1: NavBar Patterns')),
    body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children:[ElevatedButton(onPressed:()=>Navigator.push(context,
              MaterialPageRoute(builder:(_)=>const AppBarOnlyScreen())),
            child:const Text('AppBar Only')),
          const SizedBox(height:16),
          ElevatedButton(onPressed:()=>Navigator.push(context,
              MaterialPageRoute(builder:(_)=>const DrawerScreen())),
            child:const Text('AppBar + Drawer')),
          const SizedBox(height:16),
          ElevatedButton(onPressed:()=>Navigator.push(context,
              MaterialPageRoute(builder:(_)=>const BottomNavScreen())),
            child:const Text('AppBar + BottomNavigationBar'))])));
}

class AppBarOnlyScreen extends StatelessWidget {
  const AppBarOnlyScreen({super.key});

  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('AppBar Only'),
      actions:[IconButton(icon:const Icon(Icons.search),
          onPressed:() {
          }
          ),
        IconButton(icon:const Icon(Icons.more_vert),
          onPressed:() {
          }
          )]),
    body:const Center(child:Text('No Drawer, no BottomNavigationBar')));
}

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('AppBar + Drawer')),
    drawer:Drawer(child:ListView(padding:EdgeInsets.zero,
        children:[const DrawerHeader(decoration:BoxDecoration(color:Colors.indigo),
            child:Text('Menu',
              style:TextStyle(color:Colors.white,
                fontSize:24))),
          ListTile(leading:const Icon(Icons.home),
            title:const Text('Home'),
            onTap:()=>Navigator.pop(context)),
          ListTile(leading:const Icon(Icons.info),
            title:const Text('About'),
            onTap:()=>Navigator.pop(context)),
          ListTile(leading:const Icon(Icons.settings),
            title:const Text('Settings'),
            onTap:()=>Navigator.pop(context))])),
    body:const Center(child:Text('Open the Drawer from the top-left icon')));
}

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState()=>_BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int index=0;
  final titles=['Home',
    'Profile',
    'Statistics'];
  final bodies=const [Center(child:Text('Home Page')),
    Center(child:Text('Profile Page')),
    Center(child:Text('Statistics Page'))];

  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:Text(titles[index])),
    body:bodies[index],
    bottomNavigationBar:BottomNavigationBar(currentIndex:index,
      onTap:(i)=>setState(()=>index=i),
      items:const [BottomNavigationBarItem(icon:Icon(Icons.home),
          label:'Home'),
        BottomNavigationBarItem(icon:Icon(Icons.person),
          label:'Profile'),
        BottomNavigationBarItem(icon:Icon(Icons.bar_chart),
          label:'Statistics')]));
}
