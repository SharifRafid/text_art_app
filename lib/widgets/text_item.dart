import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_app/widgets/text_common.dart';

import '../main.dart';
import '../utils.dart';

Widget makeTextItem(BuildContext context, String text){
  return Container(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: MaterialButton(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextCom("Copy"),
              ),
              onPressed: () {
                copyToClipboard(context, text);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: TextCom("Copied to clipboard.")));
              },
            ),
          ),
          Text(text,
          style: TextStyle(
            fontSize: 40
          ),)
        ],
      ),
    ),
  );
}