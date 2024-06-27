import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  TextEditingController title1 = TextEditingController();
  TextEditingController content1 = TextEditingController();

@override
    void initState() {
      super.initState();

      title1.text = widget.note.title;
      content1.text = widget.note.subTitle;
    }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title= title ?? widget.note.title;
              widget.note.subTitle= content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: "تعديل الملاحظة",
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            mycontroller: title1,
              onChanged: (value) {
                title = value;
              },
              hint: "اسم الدكتور"),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            mycontroller: content1,
            onChanged: (value) {
              content = value;
            },
            hint: "الملاحظة",
            maxlines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorList(note: widget.note,),
        ],
      ),
    );
  }
}



class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});

  final NoteModel note ; 

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {

  late int currentIndex ;


   @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    widget.note.color = kColors[index].value ;
                    setState(() {});
                  },
                  child: ColorItem(
                    isActive: currentIndex == index,
                    color: kColors[index],
                  )),
            );
          }),
    );
  }
}