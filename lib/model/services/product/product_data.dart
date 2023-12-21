import 'package:aiden_admin/model/image-picker.dart';
import 'package:aiden_admin/model/services/product/product_details_model_class.dart';
import 'package:aiden_admin/model/getx_controller.dart';
import 'package:aiden_admin/utils/variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
  final Control controller = Get.put(Control());

// Function to store Google signed user name and email in Firestore
Future<void> storeProductrData() async {
  // Check if the user is signed in
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    // Get user data
    String productName = productname.text;
    String productDescription = productdescription.text;
    int productPrice = int.parse(productprice.text);
    String productImage = controller.imgUrl.value ;
    int productId = 1;


    // Get a reference to the Firestore database
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a document reference in the 'users' collection with the user's UID
    DocumentReference productRef = firestore.collection('Admin-User').doc("Admin_Panel").collection("user").doc(user.displayName).collection("Products").doc(productName);

    // Set the user data in the document
    try {
       DocumentSnapshot productSnapshot = await productRef.get();
  
       if (productSnapshot.exists) {
        // Product already exists, show a popup or handle it as needed
         controller.alreadyExisted.value=true;
        print('Product with the same name already exists. Handle accordingly.');
      }else{
         controller.alreadyExisted.value=false;

      await productRef.set({
        'ProductName': productName,
        'ProductDescription': productDescription,
        'ProductPrice': productPrice,
        'ProductImageUrl': productImage,
        'ProductId' : productId,
        
      });}
        print("=========================================+${productImage}+================================================================");
      print('User data stored successfully in Firestore!');
    } catch (error) {
      print('Error storing user data: $error');
    }
  } else {
    print('User is not signed in.');
  }
}





//  Future<void> getProductData() async {
//     // Check if the user is signed in
//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       try {
//         // Get a reference to the Firestore database
//         FirebaseFirestore firestore = FirebaseFirestore.instance;

//         // Get the user document from the 'User' collection (make sure it matches your collection name)
//         DocumentSnapshot userSnapshot =
//           await firestore.collection('Admin-User').doc("Admin_Panel").collection("user").doc(user.displayName).collection("Products").doc().get();
//         // Check if the document exists
//         if (userSnapshot.exists) {
//           // Extract data from the document
//           Map<String, dynamic> productdataMap =
//               userSnapshot.data() as Map<String, dynamic>;

//           // Create a User object
//           ProductData fetchedProducts = ProductData(
//             productName: productdataMap['ProductName'],
//             productDescription: productdataMap['ProductDescription'],
//             productPrice: productdataMap['ProductPrice'],
//           );

//           controller.productdata.value = fetchedProducts;
//         } else {
//           print('User document does not exist in Firestore.');
//         }
//       } catch (error) {
//         print('Error retrieving user data: $error');
//       }
//     } else {
//       print('User is not signed in.');
//     }
//   }






// Function to retrieve all product data from Firestore
Future<void> retrieveAllProductData() async {
  // Check if the user is signed in
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    // Get a reference to the Firestore database
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a reference to the collection containing all products
    CollectionReference productsCollection = firestore
        .collection('Admin-User')
        .doc("Admin_Panel")
        .collection("user")
        .doc(user.displayName)
        .collection("Products");

 
     try {
    QuerySnapshot productsSnapshot = await productsCollection.get();

    if (productsSnapshot.size > 0) {
      controller.productsList.assignAll(productsSnapshot.docs.map(
        (doc) => ProductData(
          productName: doc['ProductName'],
          productDescription: doc['ProductDescription'],
          productPrice: doc['ProductPrice'],
          imageUrl:doc['ProductImageUrl'],
          productId:doc ['ProductId']
        ),
      ).toList());
    } else {
      print('No products found in the collection.');
    }
  } catch (error) {
    print('Error retrieving product data: $error');
  }
  
  
  } else {
    print('User is not signed in.');
  }
}




