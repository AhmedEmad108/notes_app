import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
    /*required this.note */
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  //final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              /* child: Slidable(
                key: UniqueKey(),
                startActionPane: ActionPane(
                  motion: const BehindMotion(),
                  dismissible: DismissiblePane(onDismissed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.noHeader,
                      animType: AnimType.scale,
                      title: "تحذير",
                      desc: "هل متأكد من الحذف",
                      btnOkOnPress: () {
                        notes[index].delete();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 50,
                              left: 100,
                              right: 100,
                            ),
                            //padding: EdgeInsets.zero,
                            duration:
                                const Duration(seconds: 1, milliseconds: 50),
                            backgroundColor: Color(notes[index].color),
                            content: const Center(
                              child: Text(
                                'تم حذف الملحوظة بنجاح',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        );
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },
                      btnCancelOnPress: () {
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },
                      btnCancelText: "إلغاء",
                      btnOkText: "حذف",
                      descTextStyle:
                          TextStyle(color: Colors.white.withOpacity(.5)),
                    ).show();
                  }),
                  children: [
                    Container(
                      color: Colors.red,
                    ),
                  ],
                ),
                child: NoteItem(
                  note: notes[index],
                ),
              ),*/

              child: Dismissible(
                key: UniqueKey() /* ValueKey(notes[index])*/,
                /*Key(notes[index].toString()),*/
                background: Container(
                  decoration: BoxDecoration(
                    color: Color(notes[index].color).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  //color: Colors.transparent,
                  /* child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.delete,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),*/
                ),
                onDismissed: (direction) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.scale,
                    title: "تحذير",
                    desc: "هل متأكد من الحذف",
                    btnOkOnPress: () {
                      notes[index].delete();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(
                            bottom: 20,
                            left: 100,
                            right: 100,
                          ),
                          //padding: EdgeInsets.zero,
                          duration:
                              const Duration(seconds: 1, milliseconds: 50),
                          backgroundColor: Color(notes[index].color),
                          content: const Center(
                            child: Text(
                              'تم حذف الملحوظة بنجاح',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    btnCancelOnPress: () {
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    btnCancelText: "إلغاء",
                    btnOkText: "حذف",
                    descTextStyle:
                        TextStyle(color: Colors.white.withOpacity(.5)),
                  ).show();

                  /* notes[index].delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();*/
                },
                child: NoteItem(
                  note: notes[index],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
