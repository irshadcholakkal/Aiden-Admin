import 'package:aiden_admin/utils/colors.dart';
import 'package:aiden_admin/utils/texts.dart';
import 'package:aiden_admin/utils/variable.dart';
import 'package:aiden_admin/view-model/dashbord_items.dart';
import 'package:aiden_admin/view/add_product/add_products.dart';
import 'package:aiden_admin/view/dashbord/web_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
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
                onTap: (){
                  // print("adproduct");
                 
                  setState(() {
                     buildSelectedPage(selectedHomePageIndex: 3);
                  });
                
                  // setState(() {
                    
                  //   // selectedHomePageIndex = 3;
                  // });
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductPage()));
                },
                child: Container(
                  width: width!*0.1,
                  height: hight!*0.04,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.add_circle_outline_rounded,color: white,size: 15,),
                      SizedBox(width: width!*0.005,),
                        addProductButton,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: hight!*0.02,),
         SizedBox(
          width: width,
          height: hight!*0.8,
          child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
          itemBuilder:(context,index){
            return 
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: white,),
              width: width!*0.02,
              height: hight!*0.02,
              
            );
          }
           ),
         )
        ],
      ),
    );
  }
}
