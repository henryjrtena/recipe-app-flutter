import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    required this.controller,
    required this.isReadOnly,
    super.key,
  });

  final TextEditingController controller;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: isReadOnly,
      controller: controller,
      maxLines: 5,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: const InputDecoration(
        contentPadding: EdgeInsetsDirectional.all(20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        filled: true,
        fillColor: Color.fromRGBO(245, 245, 245, 1),
      ),
    );
  }
}
