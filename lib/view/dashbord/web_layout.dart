import 'package:aiden_admin/utils/colors.dart';
import 'package:aiden_admin/utils/variable.dart';
import 'package:aiden_admin/view-model/dashbord_items.dart';
import 'package:aiden_admin/view/add_product/add_products.dart';
import 'package:aiden_admin/view/dashbord/all_products.dart';
import 'package:aiden_admin/view/dashbord/dashboard.dart';
import 'package:aiden_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WebLayout extends StatefulWidget {
 // final Widget body; 
 
 const WebLayout({super.key});

  @override
  State<WebLayout> createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> {
  int selectedHomePageIndex=0;
  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: brandName(35.0, black, FontWeight.w600),
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_rounded)),
        ],
      ),
      body: SizedBox(
        child: Row(
          children: [
            SizedBox(
              width: width! * 0.13,
              height: hight,
              child: Column(
                children: [
                  SizedBox(
                    width: width,
                    height: hight! * 0.3,
                    child: ListView.builder(
                        itemCount: dashBoardItem.length,
                        itemBuilder: (context, index) {
                          
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AspectRatio(
                              aspectRatio: 3,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedHomePageIndex = index;
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectedHomePageIndex == index
                                            ? Colors.blueGrey.withOpacity(0.7)
                                            : Colors.grey.shade200),
                                    width: width,
                                    height: hight! * 0.06,
                                    child: FittedBox(
                                      alignment: Alignment.centerLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child:
                                            Row(children: dashBoardItem[index]),
                                      ),
                                    )),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            Expanded(
                child: 
                 Container(
                    color: grey.withOpacity(0.2), child:
                     selectedHomePageIndex==3?AddProductPage():buildSelectedPage(selectedHomePageIndex: selectedHomePageIndex)

                    // AllProducts()
                    // DashBoard(),
                    )
                    )
          ],
        ),
      ),
    );
  }
}

Widget buildSelectedPage({int selectedHomePageIndex=0}) {
  
  
  switch (selectedHomePageIndex) {
    case 0:
      return const DashBoard();
    case 1:
      return const AllProducts();
    case 2:
      return const AllProducts();
      case 3:
      return const AddProductPage();
      

    // Add more cases for other pages if needed
    default:
      return Container(); // Default case, you can replace it with a default page or an empty container
  }
}


