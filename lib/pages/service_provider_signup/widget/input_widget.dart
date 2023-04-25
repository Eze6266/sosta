import 'package:flutter/material.dart';

import '../../../constant.dart';

class InputWidget extends StatefulWidget {
  String? hintText;
  String? prefixText;
  bool? obscureText;
  TextInputType? type;
  int? maxlines;
  void Function(String)? onChanged;

  InputWidget(
      {super.key,
      this.hintText,
      this.prefixText,
      required this.onChanged,
      this.obscureText = false,
      this.type,
      this.maxlines = 1});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  Widget build(BuildContext context) {
    return SizedBox(
        height: 59,
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: TextField(
                obscureText: widget.obscureText!,
                keyboardType: widget.type,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: tertiary),
                onChanged: widget.onChanged,
                textAlignVertical: TextAlignVertical.center,
                maxLines: widget.maxlines,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.only(top: 5, left: 10, bottom: 5),
                    labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xfffD9D9D9)),
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xfffD9D9D9)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary)),
                    border: InputBorder.none,
                    labelText: widget.hintText,
                    hoverColor: Colors.transparent,
                    prefixIcon: widget.prefixText == ''
                        ? null
                        : Container(
                            width: 10,
                            alignment: Alignment.center,
                            child: Text(widget.prefixText!),
                          ))),
          ),
        ));
  }
}
