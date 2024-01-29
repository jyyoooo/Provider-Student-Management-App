import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../model/database/student_model.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({Key? key, required this.student}) : super(key: key);
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name.toString()),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            // Circular Avatar
            Column(
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
                const SizedBox(height: 15),
                Text(
                  student.name.toString(),
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            // Student Data
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Department : ${student.department}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Phone Number : ${student.phoneNumber}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
