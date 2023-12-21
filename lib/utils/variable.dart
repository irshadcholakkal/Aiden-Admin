import 'package:aiden_admin/model/services/product/product_data.dart';
import 'package:aiden_admin/model/services/product/product_details_model_class.dart';
import 'package:aiden_admin/model/user/get_user_data_model_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double?hight;
double?width;
bool isPasswordHide = true;
// int  selectedHomePageIndex = 0;

TextEditingController productprice =TextEditingController();
TextEditingController productname =TextEditingController();
TextEditingController productdescription =TextEditingController();
ProductData productdata = controller.productdata.value!;
UserData userData = controller.userData.value!;
