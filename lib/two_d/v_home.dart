import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:two_d_app/language.dart';

import 'package:two_d_app/two_d/c_two_d_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TwoDMethodController>(
      builder: (controller) {
        return Scaffold(
          key: scaffoldState,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            centerTitle: false,
            title: Text(
              controller.methodList[controller.selectedIndex].twoDMethodTypes
                  .toString()
                  .tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  scaffoldState.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu)),
            actions: [
              Row(
                children: [
                  Text(
                    xEn() ? 'Eng' : 'မြန်မာ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                      value: xEn(),
                      activeColor: Colors.deepOrange,
                      onChanged: (value) {
                        xEn()
                            ? Get.updateLocale(const Locale('mm', 'Mm'))
                            : Get.updateLocale(const Locale('en', 'Us'));
                      })
                ],
              )
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.blueGrey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ...List.generate(
                      controller.methodList.length,
                      (index) => InkWell(
                            onTap: () {
                              controller.selectedIndex = index;
                              controller.selectedNumber = '0';
                              controller.selectedMethod =
                                  controller.methodList[index].twoDMethodTypes;
                              controller.update();
                              controller.filterNumbers();
                              scaffoldState.currentState!.closeDrawer();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: controller.selectedIndex == index
                                      ? Colors.deepOrange
                                      : Colors.transparent,
                                  border: const Border.symmetric(
                                      horizontal:
                                          BorderSide(color: Colors.grey))),
                              child: Text(
                                controller.methodList[index].twoDMethodTypes
                                    .toString()
                                    .tr,
                                style: TextStyle(
                                    fontWeight:
                                        controller.selectedIndex == index
                                            ? FontWeight.bold
                                            : FontWeight.w600,
                                    color: controller.selectedIndex == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ),
          body: SizedBox.expand(
            child: Column(children: [
              Expanded(
                  child: GridView.builder(
                      itemCount: controller.numberList.length,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 5,
                              crossAxisCount: 10),
                      itemBuilder: (context, index) {
                        String num = controller.numberList[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: controller.filterList.contains(num)
                                  ? Colors.deepOrange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5)),
                          alignment: Alignment.center,
                          child: Text(
                            num,
                            style: TextStyle(
                              color: controller.filterList.contains(num)
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      })),
              // num list
              if (controller.methodList[controller.selectedIndex].xNeedNum)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(10, (index) {
                    return Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.selectedNumber = index.toString();
                          controller.filterNumbers();
                          controller.update();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 5),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color:
                                  controller.selectedNumber == index.toString()
                                      ? Colors.deepOrange
                                      : Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              color:
                                  controller.selectedNumber == index.toString()
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

              const SizedBox(
                height: 50,
              )
            ]),
          ),
        );
      },
    );
  }
}
