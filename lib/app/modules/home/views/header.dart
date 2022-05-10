import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gpsapp/app/routes/app_pages.dart';
import 'package:gpsapp/app/styles/boxshadow.dart';
import 'package:gpsapp/app/styles/colors.dart';
import 'package:gpsapp/app/values/strings.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
        child: Row(
          children: [
            SizedBox(
                width: 140,
                child: SvgPicture.asset(logoApp, semanticsLabel: 'logoApp')),
            Spacer(),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: black2,
                  boxShadow: defaultBoxShadow),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.notifications,
                      color: gold,
                      size: 26,
                    ),
                  ),
                  Align(
                      alignment: Alignment(0.55, -0.4),
                      child: CircleAvatar(backgroundColor: red, radius: 4))
                ],
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppPages.PROFILE);
              },
              child: Container(
                child: Icon(Icons.person, color: gold),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: black2,
                    boxShadow: defaultBoxShadow),
              ),
            )
          ],
        ));
  }
}
