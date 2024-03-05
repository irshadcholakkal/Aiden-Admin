import 'dart:convert';

import 'package:aiden_admin/model/getx_controller.dart';
import 'package:aiden_admin/model/services/authentication_services.dart';
import 'package:aiden_admin/model/services/categories/categories_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
 getAllCategories() async {
    final Control controller = Get.put(Control());

    try {
      final response = await pb.collection('categories').getFullList();
     controller.dropdownItems.value = response.map<Categories>((record) => Categories.fromJson(record.toJson())).toList();
     

    } catch (e) {
      print('Error fetching data: $e');
    }
  }


// getallproducts()async{
//   try {
//      final records = await pb.collection('Products').getFullList(
  
// );
// print("hjhjhjhj${records}");
//     } catch (e) {
//       print('Error fetching data: $e');
//     }

// }