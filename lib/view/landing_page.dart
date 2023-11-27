import 'package:aiden_admin/utils/variable.dart';
import 'package:aiden_admin/view/login/login_screen.dart';
import 'package:aiden_admin/view/sign-up/reigster_screen.dart';
import 'package:aiden_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
    bool showLoginPage = true;
  
  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          SizedBox(
            height: hight,
            width: width! * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                brandName(100.0, Colors.black, FontWeight.w400),
                adminpaneltext(20.0, Colors.grey.shade700, FontWeight.w500)
              ],
            ),
          ),
           Expanded(
            child:showLoginPage? SignupPage(togglePage: togglePage): Loginscreen(togglePage: togglePage)
            
          )
        ],
      ),
    ));
  }

   void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }




}
