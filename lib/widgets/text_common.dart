import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_app/main.dart';

class TextCom extends StatelessWidget {
  final TextStyle? style;
  final String s;

  const TextCom(this.s, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      s,
      style: style ??
          const TextStyle(
            color: primaryText,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
    );
  }
}
