import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../../../../controller/provider/student_provider.dart';
import '../../../../model/database/student_model.dart';
import '../../details/student_details.dart';
import '../../edit/edit_student_page.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    final studentProvider =
        Provider.of<StudentProvider>(context, listen: false);
    return Slidable(
      startActionPane: ActionPane(motion: const DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudentDetailsPage(
                          student: student,
                        )));
          },
          label: 'View ${student.name}',
          icon: CupertinoIcons.square_list,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
        )
      ]),
      endActionPane: ActionPane(motion: const DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditStudentPage(
                          student: student,
                        )));
          },
          label: 'Edit',
          icon: CupertinoIcons.pencil_ellipsis_rectangle,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
        ),
        SlidableAction(
          onPressed: (context) {
            deleteDialog(context, studentProvider);
          },
          label: 'Delete',
          icon: CupertinoIcons.delete,
          backgroundColor: Colors.red,
        )
      ]),
      child: Center(
          child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: CircleAvatar(
                backgroundColor: Colors.teal.shade50,
                radius: 30,
                child: const Icon(
                  CupertinoIcons.person,
                  color: Colors.teal,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(student.name.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500)),
              const SizedBox.square(dimension: 6),
              Text(student.department.toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.grey))
            ],
          ),
        ],
      )),
    );
  }

  Future<dynamic> deleteDialog(
      BuildContext context, StudentProvider studentProvider) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you to delete ${student.name}?',
              style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                studentProvider.deleteStudent(student.id!);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 980),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blue,
                    behavior: SnackBarBehavior.floating,
                    content: Text('${student.name} deleted.')));
              },
              child: const Text(
                'Delete',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        );
      },
    );
  }
}
