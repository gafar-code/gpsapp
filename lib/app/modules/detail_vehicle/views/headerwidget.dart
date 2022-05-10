import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpsapp/app/styles/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              CircleAvatar(radius: 30, backgroundColor: white),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("VARIO",
                      style: TextStyle(
                          color: gold,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  Text("S 2766 MZ",
                      style: TextStyle(color: white, fontSize: 18))
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.query_stats_rounded,
                        color: gold,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "jalan",
                        style: TextStyle(color: white, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.battery_75_percent,
                        color: green,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "75 %",
                        style: TextStyle(color: white, fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Subs : 01-03-25",
                    style: TextStyle(color: white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
