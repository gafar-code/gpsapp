import 'package:flutter/material.dart';
import 'package:gpsapp/app/styles/colors.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(height: 8),
            Text(
              "Harga mie instant naik",
              style: TextStyle(color: grey, fontSize: 17),
            ),
            SizedBox(height: 5),
            Text(
              "pemerintah mengabarkan harga pokok akan naik, begini tenggapan lesty",
              style: TextStyle(color: grey.withOpacity(0.75), fontSize: 14),
            ),
          ],
        ));
  }
}
