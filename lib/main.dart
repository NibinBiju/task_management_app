// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/controller/task_manager_controller.dart';
import 'package:task_management_app/model/task_manager_model.dart';
import 'package:task_management_app/views/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (Hive.isAdapterRegistered(1)) {
  } else {
    Hive.registerAdapter(TaskManagerModelAdapter());
  }
  var box = await Hive.openBox('taskDb');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskManagerController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
