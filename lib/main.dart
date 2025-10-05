import 'package:flutter/material.dart';
import 'package:socialmedia/home.dart';
import 'package:socialmedia/details.dart';
import 'package:socialmedia/post.dart';



class MainApp extends StatefulWidget
{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp>
{
  int _selectedIndex = 0;
  static const List<IconData> _bnavicons = [ Icons.home, Icons.add, Icons.person_outlined];
  static const List<String> _bnavtitles = [ 'Home', 'Upload', 'Profile'];

  //stuff

  @override
  Widget build (BuildContext)
  {
    return Scaffold
    (
      body: Stack
      (
        children:
        [
          _buildScreen(_selectedIndex),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar
      (
        type: BottomNavigationBarType.fixed,
        items: List.generate
        (
          _bnavicons.length, 
          (index) => BottomNavigationBarItem
          (
            icon: Icon(_bnavicons[index], 
            size:25, 
            color:Colors.grey),
          label:_bnavtitles[index]
          )
        ),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      )
    );
  }
}

Widget _buildScreen(int index)
{
  switch (index)
  {
    case 0: return HomeScreen();
    case 1: return Container();
    case 2: return Container();
    default: return HomeScreen();
  }
}

void main()
{
  runApp(MaterialApp
  (
    title: "Social App",
    debugShowCheckedModeBanner: false,
    home: MainApp(),
    theme: ThemeData
    (
      fontFamily: 'Poppins',
      splashColor: Colors.transparent
    ))
  );
}