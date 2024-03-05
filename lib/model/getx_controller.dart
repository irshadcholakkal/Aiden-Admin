import 'dart:io';

import 'package:aiden_admin/model/services/authentication_services.dart';
import 'package:aiden_admin/model/services/categories/categories.dart';
import 'package:aiden_admin/model/services/categories/categories_model.dart';
import 'package:aiden_admin/model/services/product/product_data.dart';
import 'package:aiden_admin/model/services/product/product_details_model_class.dart';
import 'package:aiden_admin/model/user/get_user_data_model_class.dart';
import 'package:aiden_admin/model/user/user_data.dart';
import 'package:aiden_admin/view/add_product/add_products.dart';
import 'package:aiden_admin/view/dashbord/all_products.dart';
import 'package:aiden_admin/view/dashbord/dashboard.dart';
import 'package:aiden_admin/view/dashbord/web_layout.dart';
import 'package:aiden_admin/view/sign-up/landing_page.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pocketbase/pocketbase.dart';


class Control extends GetxController{
@override
  void onInit()async{

    super.onInit();
        

    final  user=pb.authStore.token;
            if(user !=null){
               await  getProductData();
            }
    
    //  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //     if (user == null) {
    //       Get.offAll(() => const LandingPage());
    //     } else {
    //       getUserData();
    //       // productdata();
    //      // retrieveAllProductData();
    //     //if (user.providerData.any((userInfo) => userInfo.providerId == 'google.com')) {
    //       Get.offAll(() => WebLayout());
    //   //  }
    //     }
    //   },
        
      
    //   );



  // if (user.isValid ) {
  //   // If user is not authenticated, navigate to LandingPage
  //   Get.offAll(() => WebLayout());
  // } else {
  //   // If user is authenticated, fetch user data and navigate to appropriate screen
  // //  getUserData();
  //   Get.offAll(() => const LandingPage());/
   //}
    }

  Rx<File?> imageFile =Rx<File?>(null);
 Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
 
    RxList<ProductData> productsList = RxList<ProductData>([]);
    Rx<UserData?> userData = Rx<UserData?>(null);
    Rx<ProductData?> productdata = Rx<ProductData?>(null);

    RxInt selectedHomePageIndex=0.obs;
    RxInt index=0.obs;
    RxBool addProductButtonBool=true.obs;
    RxBool alreadyExisted =true.obs;
    RxString imgUrl="".obs;
    RxBool saveButton =true.obs;

   RxList<Categories> categories = <Categories>[].obs;
   Rx<Categories?> selectedCategory  =Rx<Categories?>(null);
     RxList<Categories> dropdownItems =<Categories>[].obs;


 //Rx<Categories?> category =Rx<Categories?>(null);
   
  
}