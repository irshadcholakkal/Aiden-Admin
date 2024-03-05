import 'package:aiden_admin/model/image-picker.dart';
import 'package:aiden_admin/model/image_store.dart';
import 'package:aiden_admin/model/services/categories/categories.dart';
import 'package:aiden_admin/model/services/categories/categories_model.dart';
import 'package:aiden_admin/model/services/product/product_data.dart';
import 'package:aiden_admin/utils/colors.dart';
import 'package:aiden_admin/utils/variable.dart';
import 'package:aiden_admin/view-model/custom_textfield.dart';
import 'package:aiden_admin/view-model/custome_dropdown.dart';
import 'package:aiden_admin/widgets/custome_button.dart';
import 'package:aiden_admin/widgets/widgets.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/getx_controller.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final Control controller = Get.put(Control());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width! * 0.01,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    // pickImage();
                    fetchImage();
                  },
                  child: Obx(
                    () => Container(
                        width: width! * 0.3,
                        height: hight! * 0.3,
                        color: black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (controller.imageBytes.value != null)
                              Image.memory(
                                controller.imageBytes.value!,
                                width: width! * 0.3,
                                height: hight! * 0.3,
                                // fit: BoxFit.fill,
                              ),
                            if (controller.imageBytes.value == null)
                              Center(
                                  child: Text("Add Image",
                                      style: GoogleFonts.rubik(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: white)))
                          ],
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
            width: width! * 0.55,
            child: customeTextField(
                labelText: "Product Name", controller: productname)),
        SizedBox(
            width: width! * 0.55,
            child: customeTextField(
                labelText: "Product Description",
                controller: productdescription)),

        SizedBox(
          width: width! * 0.55,
          child: Obx(
            ()=> CustomDropDown(
              items:controller.dropdownItems
                  .map((category) => TextValueItem(
                        text: category.field.toString(),
                        value: category,
                      ))
                  .toList(),
              onChanged: (categories) {
                controller.selectedCategory.value = categories;
              },
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              filled: false,
              hintText: 'Category',
              contentPadding: const EdgeInsets.all(20),
            ),
          ),
        ),


      
        SizedBox(
            width: width! * 0.55,
            child: customeTextField(
                labelText: "Product Price", controller: productprice)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: width! * 0.2,
                child: customeButton(
                    text: "cancel",
                    onpressed: () {
                      controller.addProductButtonBool.value =
                          !controller.addProductButtonBool.value;
                    },
                    bgColor: const MaterialStatePropertyAll(Colors.black))),
            Obx(
              () => SizedBox(
                  width: width! * 0.2,
                  height: hight! * .06,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (controller.alreadyExisted.value == false)
                          controller.addProductButtonBool.value =
                              !controller.addProductButtonBool.value;
                        controller.saveButton.value =
                            !controller.saveButton.value;

                        //  await saveToStore();
                        await storeProductrData().then((value) => controller
                            .saveButton.value = !controller.saveButton.value);
                        productdescription.clear();
                        productname.clear();
                        productprice.clear();
                        controller.imageBytes.value = null;

                        controller.productsList.refresh();
                        print("==============sucess====================");
                        const SnackBarPage();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                      ),
                      child: controller.saveButton.value
                          ? customeText(text: "Save", textcolor: white)
                          : const CircularProgressIndicator(
                              color: white,
                              strokeCap: StrokeCap.round,
                            ))),
            ),
          ],
        ),
      ],
    );
  }
}
