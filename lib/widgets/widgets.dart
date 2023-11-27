import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandName(size, colour, weight) {
  return Text("AIDEN",
      style: GoogleFonts.josefinSans(
          fontSize: size, fontWeight: weight, color: colour));
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
    style: GoogleFonts.poppins(
        color: textcolor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        letterSpacing: 1),
  );
}
