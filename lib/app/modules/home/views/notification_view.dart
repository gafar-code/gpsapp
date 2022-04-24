import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gpsapp/app/styles/colors.dart';

class NotificationView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
      decoration:
          BoxDecoration(color: black2, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: red, borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.warning,
              size: 18,
              color: white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "stok mie instan menipis",
                style: TextStyle(color: white, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text("Vario 5 detik yang lalu",
                  style: TextStyle(color: grey, fontSize: 18)),
            ],
          ),
          Spacer(),
          Icon(Icons.chevron_right, color: white)
        ],
      ),
    );
  }
}
