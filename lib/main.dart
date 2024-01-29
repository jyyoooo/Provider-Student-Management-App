import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/helper/db_helper.dart';
import 'controller/provider/student_provider.dart';
import 'view/home/homescreen/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper().initDatabase();
  StudentProvider().fetchAllStudent();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => ImagePickerProvider(),
        // ),
        FutureProvider(
          create: (_) => context.read<StudentProvider>().fetchAllStudent(query: ''),
          initialData: null,
        ),
      ],
      child: const MaterialApp(
        title: 'Provider Student Management',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
