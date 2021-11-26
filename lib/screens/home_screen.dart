import 'package:flutter/material.dart';
import 'package:hive_database_test/db/db_functions.dart';
import 'package:hive_database_test/widget/add_student_widget.dart';
import 'package:hive_database_test/widget/list_student_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [AddStudent(), const Expanded(child: ListStudents())],
      ),
    );
  }
}
