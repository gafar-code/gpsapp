import 'package:flutter/material.dart';
import 'package:gpsapp/app/styles/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final Function() function;
  final double? width;
  final double? height;
  final String? title;
  final Color? color;
  ButtonPrimary(this.function,
      {this.width, this.height, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Material(
      // tomboll submit login
      color: color ?? gold,
      borderRadius: BorderRadius.circular(90),
      child: InkWell(
        splashColor: blue,
        borderRadius: BorderRadius.circular(90),
        onTap: function,
        child: Container(
          height: height ?? 45,
          width: width ?? _size.width * 0.45,
          child: Center(
            child: Text(
              title ?? "Sign In",
              style: TextStyle(
                  color: black2, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
