import 'package:flutter/material.dart';
import 'package:flutter_project/theme/colors/light_colors.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  TopContainer({this.height, this.width, this.child, this.padding});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding!=null ? padding : EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      decoration: BoxDecoration(
          color: LightColors.kBiruNavbar,
          boxShadow: [
            BoxShadow(
              color: LightColors.kBlue.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(1, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
