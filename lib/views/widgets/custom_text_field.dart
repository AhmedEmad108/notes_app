import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint,  this.maxlines  = 1, this.onSaved, this.onChanged,  this.mycontroller});

  final String hint;
  final int maxlines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? mycontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller ,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'مطلوب';

        }else{
          return null;
        }
      },
      maxLines: maxlines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          hintText: hint,
          /* hintStyle: TextStyle(
          color: kPrimaryColor,
        ),*/
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
