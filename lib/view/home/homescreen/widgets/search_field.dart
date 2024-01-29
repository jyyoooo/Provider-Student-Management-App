import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_student/controller/helper/debouncer.dart';

import '../../../../controller/provider/student_provider.dart';

class SearchField extends StatelessWidget {
  SearchField({
    super.key,
  });

  final Debouncer debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    final studentProvider =
        Provider.of<StudentProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CupertinoSearchTextField(
        backgroundColor: Colors.grey[200],
        // onSubmitted: (value) => log('on submitted works'),

        onChanged: (value) => debouncer.call(() {
          log('indebouncer call');
          studentProvider.fetchAllStudent(query: value);
        }),
      ),
    );
  }
}
