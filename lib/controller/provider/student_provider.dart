import 'dart:developer';
import 'package:flutter/material.dart';

import '../../model/database/student_model.dart';
import '../helper/student_repository.dart';

class StudentProvider extends ChangeNotifier {
  List<StudentModel> _allStudents = [];

  StudentRepository studentData = StudentRepository();

  List<StudentModel> get allStudent => _allStudents;

  fetchAllStudent({String? query}) async {
    log('in fetch all students');
    var student = await studentData.getData(query ?? '');
    _allStudents = student;
    notifyListeners();
  }

  addStudent(StudentModel studentModel) {
    studentData.addData(studentModel);
    fetchAllStudent();
  }

  updateStudent(StudentModel studentModel) {
    studentData.updateData(studentModel);
    fetchAllStudent();
  }

  deleteStudent(int id) {
    studentData.deleteData(id);
    fetchAllStudent();
  }
}
