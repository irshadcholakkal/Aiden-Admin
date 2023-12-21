import 'package:aiden_admin/view/dashbord/web_layout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

//import 'firebase_options.dart';

// import { initializeApp } from "firebase/app";
// import { getAnalytics } from "firebase/analytics";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
      options: const FirebaseOptions(
          apiKey: "AIzaSyDsQnPQMhJSXauMo1VUOEeTDiRviaj50Z0",
          appId: "1:253239783033:web:e8da99b44eb11c8e67eea8",
          messagingSenderId: "253239783033",
          projectId: "aiden-14970",
          storageBucket: "aiden-14970.appspot.com",
          authDomain: "aiden-14970.firebaseapp.com",
          measurementId: "G-6S8D6X30LY"));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:

            //DashBoard()
            // LandingPage()
            WebLayout());
  }
}
