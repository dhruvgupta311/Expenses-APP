import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;
  void wrap(){
     handler();
  }
  AdaptiveFlatButton(this.text, this.handler);
  @override
  Widget build(BuildContext context){
    return Platform.isIOS
        ? CupertinoButton(
            onPressed:wrap,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        : OutlinedButton(
            onPressed: wrap,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 0, 87, 138)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 0, 87, 138).withOpacity(0.2)),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          );
  }
}
