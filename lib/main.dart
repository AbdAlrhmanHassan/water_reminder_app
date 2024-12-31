import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_reminder_app/cubit/home_page_cubit.dart';
import 'package:water_reminder_app/pages/home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => HomePageCubit(),
    child: const WaterReminderApp(),
  ));
}

class WaterReminderApp extends StatelessWidget {
  const WaterReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePage()),
    );
  }
}
