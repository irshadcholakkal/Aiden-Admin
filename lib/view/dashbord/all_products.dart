import 'package:aiden_admin/model/getx_controller.dart';
import 'package:aiden_admin/model/services/categories/categories.dart';
import 'package:aiden_admin/model/services/product/product_details_model_class.dart';
import 'package:aiden_admin/utils/colors.dart';
import 'package:aiden_admin/utils/texts.dart';
import 'package:aiden_admin/utils/variable.dart';
import 'package:aiden_admin/view-model/dashbord_items.dart';
import 'package:aiden_admin/view/add_product/add_products.dart';
import 'package:aiden_admin/view/dashbord/web_layout.dart';
import 'package:aiden_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/services/product/product_data.dart';

class AllProducts extends StatefulWidget {
  AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final Control controller = Get.put(Control());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Obx(() { 
            return controller.addProductButtonBool.value
            ? Container(
                width: width,
                height: hight,
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        allProductsText,
                        InkWell(
                          onTap: () {
                            

                            getAllCategories();
                             controller.addProductButtonBool.value=!controller.addProductButtonBool.value;
                          },
                          child: Container(
                            width: width! * 0.1,
                            height: hight! * 0.04,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: white,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: width! * 0.005,
                                  ),
                                  addProductButton,
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: hight! * 0.02,
                    ),
                  
                    SizedBox(
                      width: width,
                      height: hight! * 0.8,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                                  itemCount: controller.productsList.length,
                          itemBuilder: (context, index) {
                           // print("@@@@@@@@@@@@@@@@@@@${controller.productsList[index].imageUrl}@@@@@@@@@@@@@@2");
                              return
                             Container(
                              margin: const EdgeInsets.all(10),
                              color: white,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(10),
                              //   color: white,
                              // ),
                              width: width! * 0.02,
                              height: hight! * 0.02,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                
                                // ClipRRect(
                                //         borderRadius: const BorderRadius.all(
                                //             Radius.circular(10)),
                                //         child: Image.network(
                                //        ///   "${controller.productsList[index].imageUrl}",
                                //           fit: BoxFit.fill,
                                //           height: hight!*0.25,
                                //           width: width,
                                //         ),
                                //       ),
                    
                                Center(child: customeText(text: controller.productsList[index].productName,textcolor: black)),
                                Text("₹: ${controller.productsList[index].productPrice}",style: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w600))


                              ],),
                            );
                          }),
                    )
                  ],
                ),
              )
            : AddProductPage();
        }
      );
  }
}
