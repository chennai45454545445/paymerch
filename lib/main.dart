import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paymerch/join_us.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _State();
}

class _State extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Navigating to Demo Screen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => JoinUs()),
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         height: MediaQuery.of(context).size.height,
         width:  MediaQuery.of(context).size.width,
         child: Image.asset('image/splash.jpg', fit: BoxFit.cover,),

       ),

    );
  }
}
