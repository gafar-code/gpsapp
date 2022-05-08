import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/styles/colors.dart';

import '../controllers/navigationbar_controller.dart';

class NavigationbarView extends GetView<NavigationbarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/maps',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          // type: BottomNavigationBarType.shifting,
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Maps',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop_2),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: gold,
          unselectedItemColor: grey.withOpacity(0.5),
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
