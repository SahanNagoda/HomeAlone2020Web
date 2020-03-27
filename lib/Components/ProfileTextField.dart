import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String prefixText, initialValue, hintText;
  final bool readOnly;
  final Function onChange;
  const ProfileTextField(
      {Key key,
      @required this.prefixText,
      this.hintText,
      @required this.initialValue,
      @required this.readOnly,
      @required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        width: double.maxFinite,
        child: TextFormField(
          initialValue: initialValue,
          readOnly: readOnly,
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(8.0),
            border: InputBorder.none,
            // hintText: 'Username',
            prefixText: "$prefixText : ",
            // labelText: "Sklsn",
          ),
        ),
      ),
    );
  }
}
