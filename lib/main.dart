import "package:flutter/material.dart";
import 'package:hackathon/screens/home_page.dart';
import 'package:hackathon/screens/main_screen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple
      ),
     home: HomePage(),
    );
  }
}