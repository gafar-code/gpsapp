import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/styles/colors.dart';

import '../controllers/bottomnavbar_controller.dart';

class BottomnavbarView extends GetView<BottomnavbarController> {
  @override
  Widget build(BuildContext context) {
    Get.put(BottomnavbarController());
    Map<String, IconData> _dataMenu = {
      // list bottom navigasi
      "Beranda": Icons.home,
      "Maps": Icons.map,
      "Market": Icons.shop,
      "Person": Icons.person,
      "Settings": Icons.settings
    };
    List<Widget> _list = [];
    // check apakah index sekarang sama
    for (int index = 0; index < _dataMenu.length; index++) {
      print("$index ${controller.tabIndex}");
      _list.add(Obx(
        () => GestureDetector(
          onTap: () => controller.changeIndex(index),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Row(
              children: [
                Icon(_dataMenu[_dataMenu.keys.elementAt(index)],
                    color: controller.tabIndex.value == index
                        ? gold
                        : grey.withOpacity(0.5),
                    size: 28),
                SizedBox(width: 10),
                Text(
                    controller.tabIndex.value == index
                        ? _dataMenu.keys.elementAt(index)
                        : "",
                    style: TextStyle(color: gold, fontSize: 24)),
                controller.tabIndex.value == index
                    ? SizedBox(width: MediaQuery.of(context).size.width / 10)
                    : Center()
              ],
            ),
          ),
        ),
      ));
    }

    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _list,
          ),
        ));
  }
}
