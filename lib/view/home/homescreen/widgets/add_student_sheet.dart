import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../controller/provider/student_provider.dart';
import '../../../../model/database/student_model.dart';
import '../../../widgets/custom_text_field.dart';

addStudentSheet(BuildContext ctx) {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final studentProvider = Provider.of<StudentProvider>(ctx, listen: false);

  return showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    constraints: BoxConstraints.expand(
      height: MediaQuery.of(ctx).size.height / 1.06,
    ),
    context: ctx,
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          body: SizedBox(
            width: MediaQuery.of(ctx).size.width,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  // TITLE
                  const Text(
                    'Add Student',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // IMAGE
                  CircleAvatar(backgroundColor: Colors.teal.shade50,
                    radius: 45.0,
                    child:const Icon(
                      CupertinoIcons.person,
                      size: 45.0,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // TEXT INPUT
                  CustomTextField(
                      labelText: 'Name', controller: nameController),
                  CustomTextField(
                      labelText: 'Phone', controller: phoneNumberController),
                  CustomTextField(
                      labelText: 'Department', controller: deptController),
                  const SizedBox(height: 20),

                  // ELEVATED BUTTON
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.teal)),
                      onPressed: () async {
                        int id = DateTime.now().millisecondsSinceEpoch;

                        if (deptController.text == '' ||
                            nameController.text == '' ||
                            phoneNumberController.text == '') {
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            const SnackBar(showCloseIcon: true,
                              content: Text('Fill all fields!'),
                              backgroundColor: Colors.red,
                              margin: EdgeInsets.all(15),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else {
                          studentProvider.addStudent(StudentModel(
                              id: id,
                              department: deptController.text,
                              name: nameController.text,
                              phoneNumber: phoneNumberController.text));
                          Navigator.pop(ctx);
                          FocusScope.of(ctx).unfocus();
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            SnackBar(
                              duration: const Duration(milliseconds: 980),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              content: Text(
                                  '${nameController.text}\'s data has been added.'),
                              backgroundColor: Colors.teal,
                              margin: const EdgeInsets.all(15),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
    isDismissible: true,
    showDragHandle: true,
  );
}
