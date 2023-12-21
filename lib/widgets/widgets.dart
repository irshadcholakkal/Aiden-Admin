import 'package:aiden_admin/utils/colors.dart';
import 'package:aiden_admin/utils/variable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandName(size, colour, weight) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: Text("AIDEN",
        style: GoogleFonts.josefinSans(
            fontSize: size, fontWeight: weight, color: colour)),
  );
}
Widget adminpaneltext(size, colour, weight){
  return 
  Text("Admin-Panel",
      style: GoogleFonts.josefinSans(
          fontSize: size, fontWeight: weight, color: colour));
}

Widget customeText({String? text, Color? textcolor}) {
  return Text(
    
    "$text",
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.poppins(
        color: textcolor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: 1),
  );
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);
void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Hi, Flutter developers'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
@override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        child: Text('Show Snackbar'),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          showSnackBar(context);
        },
      ),
    );
  }
}