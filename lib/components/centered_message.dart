import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData iconData;
  final double iconSize;
  final double fontSize;

  CenteredMessage(
      {this.message, this.iconData, this.iconSize = 64, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            child: Icon(
              iconData,
              size: iconSize,
            ),
            visible: iconData != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              message,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
