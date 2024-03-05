// import 'package:aiden_admin/model/image-picker.dart';
// import 'package:aiden_admin/model/services/authentication_services.dart';
// import 'package:aiden_admin/model/services/categories/categories_model.dart';
// import 'package:aiden_admin/model/services/product/product_details_model_class.dart';
// import 'package:aiden_admin/model/getx_controller.dart';
// import 'package:aiden_admin/utils/variable.dart';
// import 'package:get/get.dart';
//   final Control controller = Get.put(Control());

// // Function to store Google signed user name and email in Firestore
// Future<void> storeProductrData() async {
//   // Check if the user is signed in
//   // User? user = FirebaseAuth.instance.currentUser;
//   if (authData!= null) {
//     // Get user data
//     String productName = productname.text;
//     String productDescription = productdescription.text;
//     int productPrice = int.parse(productprice.text);
//     String productImage = controller.imgUrl.value ;
//     int productId = 1;
//     String? category = controller.selectedCategory.value?.id;

//     print(category);
//     print(controller.selectedCategory.value);
//         print(controller.selectedCategory.value?.id);



   
//     try {
     


//           final body = <String, dynamic>{
//   "name": productName,
//   "brand": "test",
//   "offer": true,
//   "offerprice": 123,
//   "instock": true,
//   "price": productPrice,
//   "category": category
// };

// final record = await pb.collection('Products').create(body: body); 



// print(record);
//     } catch (error) {
//       print('Error storing user data: $error');
//     }
//   } else {
//     print('User is not signed in.');
//   }
// }

// import 'dart:convert';
// import 'dart:io';
// import 'package:aiden_admin/model/services/product/product_details_model_class.dart';
// import 'package:aiden_admin/utils/variable.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:pocketbase/pocketbase.dart';
// import 'package:aiden_admin/model/services/authentication_services.dart';
// import 'package:aiden_admin/model/services/categories/categories_model.dart';
// import 'package:aiden_admin/model/getx_controller.dart';
// import 'package:get/get.dart';


// final Control controller = Get.put(Control());

// Future<void> storeProductrData() async {
//   try {
//     // Check if the user is signed in
//     if (authData != null) {
//       // Get user input and picked image
//       String productName = productname.text;
//       String productDescription = productdescription.text;
//       int productPrice = int.parse(productprice.text);
//       final imageFile = controller.imageBytes.value;

//       // Check if image was picked successfully
//       if (imageFile != null) {
//         // Encode image bytes as base64 string
//         String base64Image = base64Encode(imageFile);

//         // Upload image file to PocketBase server
//         final imageResponse = await http.post(
//           Uri.parse('https://aiden.pockethost.io/api/collections/Products/records'), 
//           body: {
//            // 'Authorization':pb.authStore.token,
//             'name': productName, 
//             'file': base64Image}, 
//         );

//         // Check if image upload was successful
//         if (imageResponse.statusCode == 200) {
//           // Extract image URL from the response
//           String imageUrl = imageResponse.body;

//           // Create a new record in PocketBase with product data and image URL
//           final body = <String, dynamic>{
//             "name": productName,
//             "brand": "test",
//             "offer": true,
//             "offerprice": 123,
//             "instock": true,
//             "price": productPrice,
//             "category": controller.selectedCategory.value?.id, // Use selected category ID
//             "image": imageUrl, // Add image URL to the product data
//           };

//           final record = await pb.collection('Products').create(body: body);
//           print('New Products record created with ID: ${record.id}');
//         } else {
//           print('Error uploading image: ${imageResponse.statusCode}');
//         }
//       } else {
//         print('No image picked.');
//       }
//     } else {
//       print('User is not signed in.');
//     }
//   } catch (error) {
//     print('Error storing product data: $error');
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:aiden_admin/model/services/product/product_details_model_class.dart';
import 'package:aiden_admin/utils/variable.dart';
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aiden_admin/model/services/authentication_services.dart';
import 'package:aiden_admin/model/services/categories/categories_model.dart';
import 'package:aiden_admin/model/getx_controller.dart';
import 'package:get/get.dart';

final Control controller = Get.put(Control());

Future<void> storeProductrData() async {
  try {
    // Check if the user is signed in
    if (authData != null) {
      // Get user input and picked image
      String productName = productname.text;
      int productPrice = int.parse(productprice.text);
      final imageFile = controller.imageBytes.value;

      // Check if image was picked successfully
      if (imageFile != null) {
        // Read image file as bytes
        List<int> imageBytes = await imageFile;
        
        // Encode image bytes as base64 string
        String base64Image = base64Encode(imageBytes);

        // Create a new record in PocketBase with product data and image URL
        final body = {
          "name": productName,
          "brand": "test",
          "offer": true,
          "offerprice": 123,
          "instock": true,
          "price": productPrice,
          "category": controller.selectedCategory.value?.id, // Use selected category ID
        };

        // Upload image file to PocketBase server
        final files = [
          http.MultipartFile.fromBytes(
            'document',
             base64Image as List<int>,
            filename: 'image.jpg', // Provide a suitable file name
           // contentType: MediaType('image', 'jpeg'), // Provide the correct content type
          ),
        ];

        final record = await pb.collection('Products').create(body: body, files: files);
        print('New Products record created with ID: ${record.id}');
      } else {
        print('No image picked.');
      }
    } else {
      print('User is not signed in.');
    }
  } catch (error) {
    print('Error storing product data: $error');
  }
}





 Future<void> getProductData() async {
    // Check if the user is signed in
  //  User? user = FirebaseAuth.instance.currentUser;

    if (authData != null) {
      try {
        // Get a reference to the Firestore database
       // FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Get the user document from the 'User' collection (make sure it matches your collection name)
        // DocumentSnapshot userSnapshot =
        //   await firestore.collection('Admin-User').doc("Admin_Panel").collection("user").doc(user.displayName).collection("Products").doc().get();
        // // Check if the document exists
      //  if (userSnapshot.exists) {

      final  response = await pb.collection('Products').getFullList();
      controller. productsList.value= response.map<ProductData>((record) => ProductData.fromJson(record.toJson())).toList();
          
          
          
          
          // Extract data from the document
          // Map<String, dynamic> productdataMap =
          //     userSnapshot.data() as Map<String, dynamic>;

          // // Create a User object
          // ProductData fetchedProducts = ProductData(
          //   productName: productdataMap['ProductName'],
          //   productDescription: productdataMap['ProductDescription'],
          //   productPrice: productdataMap['ProductPrice'],
          // );
   print("ssssssssssss${response}");
        //  controller.productdata.value = fetchedProducts;
        // } else {
        //   print('User document does not exist in Firestore.');
        // }
      } catch (error) {
        print('Error retrieving user data: $error');
      }
    } else {
      print('User is not signed in.');
    }
  }






// Function to retrieve all product data from Firestore
 //Future<void> retrieveAllProductData() async {
//   // Check if the user is signed in
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     // Get a reference to the Firestore database
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     // Create a reference to the collection containing all products
//     CollectionReference productsCollection = firestore
//         .collection('Admin-User')
//         .doc("Admin_Panel")
//         .collection("user")
//         .doc(user.displayName)
//         .collection("Products");

 
//      try {
//     QuerySnapshot productsSnapshot = await productsCollection.get();

//     if (productsSnapshot.size > 0) {
//       controller.productsList.assignAll(productsSnapshot.docs.map(
//         (doc) => ProductData(
//           productName: doc['ProductName'],
//           productDescription: doc['ProductDescription'],
//           productPrice: doc['ProductPrice'],
//           imageUrl:doc['ProductImageUrl'],
//           productId:doc ['ProductId']
//         ),
//       ).toList());
//     } else {
//       print('No products found in the collection.');
//     }
//   } catch (error) {
//     print('Error retrieving product data: $error');
//   }
  
  
//   } else {
//     print('User is not signed in.');
//   }
// }




//    import 'package:aiden_admin/model/getx_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// final Control controller = Get.put(Control()

