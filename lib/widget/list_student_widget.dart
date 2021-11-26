// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_database_test/db/db_functions.dart';
import 'package:hive_database_test/model/data_model.dart';

class ListStudents extends StatelessWidget {
  const ListStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(studentList[index].name),
              subtitle: Text(studentList[index].age),
              leading: Text(studentList[index].id.toString()),
              trailing: IconButton(
                onPressed: () {
                  if (studentList[index].id != null) {
                    deleteStudents(studentList[index].id!);
                  } else {
                    print("Id Null, cant delete");
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
