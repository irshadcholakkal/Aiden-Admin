
import 'package:aiden_admin/view/dashbord/web_layout.dart';
import 'package:aiden_admin/view/dashbord/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      
      //DashBoard()
      //LandingPage()
      WebLayout()
    );
  }
}
