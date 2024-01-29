import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/provider/student_provider.dart';
import 'widgets/add_student_sheet.dart';
import 'widgets/search_field.dart';
import 'widgets/student_card.dart';
import 'widgets/custom_seperator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).unfocus();
    //FETCHING
    context.read<StudentProvider>().fetchAllStudent();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40), child: SearchField()),
        toolbarHeight: 70,
        title: const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Text(
            'Provider Student Management',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            addStudentSheet(context);
          },
          child: const Icon(
            CupertinoIcons.add,
            color: Colors.white,
          )),
      body: Column(
        children: [
          Expanded(
            child: Consumer<StudentProvider>(
                builder: (context, studentData, child) {
              return studentData.allStudent.isNotEmpty
                  ? ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          StudentCard(student: studentData.allStudent[index]),
                      separatorBuilder: (context, index) =>
                          const CustomSeperator(),
                      itemCount: studentData.allStudent.length)
                  : const Center(
                      child: Text('No Student Data Available',
                          style: TextStyle(color: Colors.grey)));
            }),
          ),
        ],
      ),
    );
  }
}
