import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_app/main.dart';
import 'package:text_app/widgets/text_common.dart';

class TwoChoicesButton extends StatefulWidget {
  final String firstChoice;
  final String secondChoice;
  final ValueChanged<String> onChanged;

  TwoChoicesButton({
    required this.firstChoice,
    required this.secondChoice,
    required this.onChanged,
  });

  @override
  _TwoChoicesButtonState createState() => _TwoChoicesButtonState();
}

class _TwoChoicesButtonState extends State<TwoChoicesButton> {
  String selectedChoice = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedChoice = widget.firstChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedChoice = widget.firstChoice;
                widget.onChanged(selectedChoice);
              });
            },
            style: ElevatedButton.styleFrom(
              primary: selectedChoice == widget.firstChoice
                  ? primaryColor // Customize selected button color
                  : Colors.grey, // Customize unselected button color
            ),
            child: TextCom(widget.firstChoice),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedChoice = widget.secondChoice;
                widget.onChanged(selectedChoice);
              });
            },
            style: ElevatedButton.styleFrom(
              primary: selectedChoice == widget.secondChoice
                  ? primaryColor // Customize selected button color
                  : Colors.grey, // Customize unselected button color
            ),
            child: TextCom(widget.secondChoice),
          ),
        ),
      ],
    );
  }
}