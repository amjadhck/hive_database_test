// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:hive_database_test/db/db_functions.dart';
import 'package:hive_database_test/model/data_model.dart';

class AddStudent extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Age',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              onAddStudent();
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Student"),
          )
        ],
      ),
    );
  }

  Future<void> onAddStudent() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if (_name == null || _age == null) {
      print("error");
      return;
    } else {
      final _student = StudentModel(name: _name, age: _age);
      await addStudent(_student);
    }
  }
}
