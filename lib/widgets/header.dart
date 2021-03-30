import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle =false , String titleText,
              removebackbutton = false}) {
  return AppBar(
    automaticallyImplyLeading: removebackbutton? false : true,
    title: Text(
      isAppTitle ? "Ecosphere" : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: isAppTitle? "Signatra": "",
        fontSize: isAppTitle ? 50.0: 22.5
      )
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).primaryColor,
  );
}