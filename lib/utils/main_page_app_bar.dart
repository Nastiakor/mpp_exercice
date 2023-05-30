import 'package:flutter/material.dart';
import 'package:mpp/style.dart';

AppBar buildMainAppBar() {
  return AppBar(
    backgroundColor: mainAppBarColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'images/mpp_logo.png',
          width: 130,
        ),
      ],
    ),
  );
}