import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/provider/student_provider.dart';
import '../../../model/database/student_model.dart';
import '../../widgets/custom_text_field.dart';
import 'widgets/update_button.dart';

class EditStudentPage extends StatelessWidget {
  const EditStudentPage({Key? key, required this.student}) : super(key: key);
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context, listen: true);
    final updatedStudent = studentProvider.allStudent.firstWhere((e) => e.id == student.id);

    TextEditingController nameController = TextEditingController(text: updatedStudent.name);
    TextEditingController departmentController = TextEditingController(text: updatedStudent.department);
    TextEditingController phoneNumberController = TextEditingController(text: updatedStudent.phoneNumber);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${updatedStudent.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade50,
              radius: 45.0,
              child: const Icon(
                CupertinoIcons.person,
                size: 45.0,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20.0),
            // TextFormFields for Editing Student Data
            CustomTextField(
              controller: nameController,
              labelText: 'Name',
            ),
            CustomTextField(
              controller: departmentController,
              labelText: 'Department',
            ),
            CustomTextField(
              controller: phoneNumberController,
              labelText: 'Phone Number',
            ),
            const SizedBox(height: 20.0),
            // Save Button
            Container(
              alignment: Alignment.center,
              child: UpdateButton(
                  studentProvider: studentProvider,
                  student: student,
                  departmentController: departmentController,
                  nameController: nameController,
                  phoneNumberController: phoneNumberController,
                  updatedStudent: updatedStudent),
            ),
          ],
        ),
      ),
    );
  }
}
