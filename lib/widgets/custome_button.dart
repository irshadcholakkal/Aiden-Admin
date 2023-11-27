
import 'package:aiden_admin/utils/colors.dart';
import 'package:aiden_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';

Widget customeButton(
    {String? text,
    context,
    void Function()? onpressed,
    MaterialStateProperty<Color?>? bgColor}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .9,
    height: MediaQuery.of(context).size.height * .06,
    child: ElevatedButton(
      onPressed: onpressed,
      style: ButtonStyle(
        backgroundColor: bgColor,
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      ),
      child: customeText(text: text, textcolor: white),
    ),
  );
}


  


   
   










