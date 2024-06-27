import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/eit_note_view_body.dart';

class EditNewView extends StatelessWidget {
  const EditNewView({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: EditNoteViewBody(
        note: note,
      ))),
    );
  }
}
