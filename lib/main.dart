
import 'package:aiden_admin/view/dashbord/web_layout.dart';
import 'package:aiden_admin/view/dashbord/home.dart';
import 'package:aiden_admin/view/sign-up/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
);
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      
      //DashBoard()
      LandingPage()
       //WebLayout()
    );
  }
}
