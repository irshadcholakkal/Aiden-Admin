// import 'dart:html';
// import 'dart:io' if (dart.library.html) 'dart:typed_data';

// import 'package:aiden_admin/model/getx_controller.dart';
// import 'package:aiden_admin/model/image_store.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:universal_io/io.dart';
//   final Control controller = Get.put(Control());

// Future<void> pickImage() async {
//   if (kIsWeb) {
//     html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.click();

//     uploadInput.onChange.listen((e) {
//       final files = uploadInput.files;
//       if (files != null && files.isNotEmpty) {
//         final file = files.first;
//         final reader = html.FileReader();

//         reader.onLoadEnd.listen((e) {
//           // Do something with the fileBytes (image data)
//           final Uint8List fileBytes = reader.result as Uint8List;

//           if (fileBytes.isNotEmpty) {
//             // Convert Uint8List to File
//             final File imageFile = File.fromRawPath(fileBytes);
//             uploadImageToFirebase(imageFile);

//             // Set the selected image file in the controller
//             // controller.imageFile?.value = imageFile;

//             // Now you can use the File object to upload to Firebase
//             // await uploadImageToFirebase(imageFile);

//             // ... rest of your code
//           } else {
//             print("Error: Selected file has no bytes.");
//           }

//           print("Image pickeddd: ${file.name}");
//         });

//         reader.readAsArrayBuffer(file);
//       }
//     });
//   } else {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'jpeg', 'png'],
//     );

//     if (result != null) {
//       Uint8List fileBytes = result.files.single.bytes!;

//       // Do something with the fileBytes (image data)

//       if (fileBytes.isNotEmpty) {
//         // Convert Uint8List to File
//         File imageFile = File.fromRawPath(fileBytes);

//         // Set the selected image file in the controller
//         // controller.imageFile?.value = imageFile;

//         // Now you can use the File object to upload to Firebase
//         // await uploadImageToFirebase(imageFile);

//         // ... rest of your code
//       } else {
//         print("Error: Selected file has no bytes.");
//       }

//       print("Image picked: ${result.files.single.name}");
//     } else {
//       // User canceled the picker
//       print("File picking canceled");
//     }
//   }
// }
import 'dart:html';
import 'dart:typed_data';
import 'package:aiden_admin/model/getx_controller.dart';
import 'package:aiden_admin/utils/variable.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

// Assuming you have a GetX controller
final controller = Get.put(Control());

fetchImage() {
  FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';
  // FirebaseStorage fs = FirebaseStorage.instance;

  // Trigger the file input dialog
  input.click();

  // Listen for changes in the file input
  input.onChange.listen((event) {
    final file = input.files?.first;
    if (file != null) {
      final reader = FileReader();

      // Read the file as an array buffer
      reader.readAsArrayBuffer(file);

      reader.onLoadEnd.listen((event) {
        // Convert the loaded data to Uint8List
        Uint8List data = Uint8List.fromList(reader.result as List<int>);
        
        // Store the image bytes in the GetX controller
        controller.imageBytes.value = data;

        // Create a blob from the Uint8List
         blob = Blob([data]);

        // Specify the path and upload the blob to Firebase Storage
      });
    }
  });
}
Blob ?blob;
saveToStore() async {
  // FirebaseStorage fs = FirebaseStorage.instance;

  // try {
  //   // Specify the path and upload the blob to Firebase Storage
  //   var snapshot = await fs.ref().child(productname.text).putBlob(blob);

  //   // Get the download URL of the uploaded file
  //   String downloadUrl = await snapshot.ref.getDownloadURL();
       
  //   // Update the UI or state with the download URL
  //   controller.imgUrl.value = downloadUrl;
  //   print("=====${controller.imgUrl.value}====");
  //   print(downloadUrl);
  // } catch (error) {
  //   print('Error uploading image to Firebase Storage: $error');
  // }
}
