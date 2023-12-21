import 'package:aiden_admin/utils/colors.dart';
import 'package:aiden_admin/utils/variable.dart';
import 'package:aiden_admin/view-model/dashbord_items.dart';
import 'package:aiden_admin/view/add_product/add_products.dart';
import 'package:aiden_admin/view/dashbord/all_products.dart';
import 'package:aiden_admin/view/dashbord/dashboard.dart';
import 'package:aiden_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/getx_controller.dart';

class WebLayout extends StatelessWidget {
  // final Widget body;

  WebLayout({super.key});

  final Control controller = Get.put(Control());

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
          Obx(() {
            if (controller.userData.value != null) {
              return CircleAvatar(
                backgroundImage: NetworkImage(userData.photoURL),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
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
                                controller.selectedHomePageIndex.value = index;
                              },
                              child: Obx(
                                () => Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: controller.selectedHomePageIndex
                                                    .value ==
                                                index
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
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                  color: grey.withOpacity(0.2),
                  child: Obx(() => buildSelectedPage(
                      selectedHomePageIndex:
                          controller.selectedHomePageIndex.value))

                  // AllProducts()
                  // DashBoard(),
                  ))
        ],
      ),
    );
  }
}

Widget buildSelectedPage({int selectedHomePageIndex = 0}) {
  switch (selectedHomePageIndex) {
    case 0:
      return const DashBoard();
    case 1:
      return AllProducts();
    case 2:
      return AddProductPage();
    case 3:
      return AddProductPage();

    // Add more cases for other pages if needed
    default:
      return Container(); // Default case, you can replace it with a default page or an empty container
  }
}
