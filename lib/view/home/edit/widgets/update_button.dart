import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../controller/provider/student_provider.dart';
import '../../../../model/database/student_model.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.studentProvider,
    required this.student,
    required this.departmentController,
    required this.nameController,
    required this.phoneNumberController,
    required this.updatedStudent,
  });

  final StudentProvider studentProvider;
  final StudentModel student;
  final TextEditingController departmentController;
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final StudentModel updatedStudent;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          backgroundColor: MaterialStatePropertyAll(Colors.teal)),
      onPressed: () {
        studentProvider.updateStudent(StudentModel(
            id: student.id,
            department: departmentController.text,
            name: nameController.text,
            phoneNumber: phoneNumberController.text));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.blue,
            behavior: SnackBarBehavior.floating,
            content: Text('${updatedStudent.name} updated.')));
      },
      child: const Text('Update'),
    );
  }
}
