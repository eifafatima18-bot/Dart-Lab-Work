import 'package:flutter/material.dart';

void main()=>runApp(const FitnessTrackerApp());

class FitnessTrackerApp extends StatelessWidget {
  const FitnessTrackerApp({super.key});

  @override
  Widget build(BuildContext context)=>const MaterialApp(debugShowCheckedModeBanner:false,
    home:FitnessHome());
}

class FitnessHome extends StatefulWidget {
  const FitnessHome({super.key});

  @override
  State<FitnessHome> createState()=>_FitnessHomeState();
}

class _FitnessHomeState extends State<FitnessHome> {
  int bottomIndex=0;
  String activeTitle='Home';
  final bottomTitles=['Home',
    'Profile',
    'Statistics'];
  final drawerTitles=['Workout Tracker',
    'Diet Monitor',
    'Progress',
    'Settings'];
  void selectDrawer(String title) {
    setState(()=>activeTitle=title);
    Navigator.pop(context);
  }
  void selectBottom(int index) {
    setState(() {
        bottomIndex=index;
        activeTitle=bottomTitles[index];
      }
      );
  }
  @override
  Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:Text(activeTitle),
      actions:[IconButton(icon:const Icon(Icons.notifications),
          onPressed:() {
          }
          ),
        IconButton(icon:const Icon(Icons.settings),
          onPressed:() {
          }
          )]),
    drawer:Drawer(child:ListView(padding:EdgeInsets.zero,
        children:[const DrawerHeader(decoration:BoxDecoration(color:Colors.teal),
            child:Text('Fitness Tracker',
              style:TextStyle(color:Colors.white,
                fontSize:22))),
          ListTile(leading:const Icon(Icons.fitness_center),
            title:Text(drawerTitles[0]),
            onTap:()=>selectDrawer(drawerTitles[0])),
          ListTile(leading:const Icon(Icons.restaurant),
            title:Text(drawerTitles[1]),
            onTap:()=>selectDrawer(drawerTitles[1])),
          ListTile(leading:const Icon(Icons.show_chart),
            title:Text(drawerTitles[2]),
            onTap:()=>selectDrawer(drawerTitles[2])),
          ListTile(leading:const Icon(Icons.settings),
            title:Text(drawerTitles[3]),
            onTap:()=>selectDrawer(drawerTitles[3]))])),
    body:Center(child:Text('$activeTitle page',
        style:const TextStyle(fontSize:24))),
    bottomNavigationBar:BottomNavigationBar(currentIndex:bottomIndex,
      onTap:selectBottom,
      items:const [BottomNavigationBarItem(icon:Icon(Icons.home),
          label:'Home'),
        BottomNavigationBarItem(icon:Icon(Icons.person),
          label:'Profile'),
        BottomNavigationBarItem(icon:Icon(Icons.bar_chart),
          label:'Statistics')]));
}
