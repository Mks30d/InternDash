import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interndash/ui/announcements_page.dart';
import 'package:interndash/ui/dashboard_page.dart';
import 'package:interndash/ui/leaderboard_page.dart';
import 'package:interndash/ui/login_page.dart';

import 'blocs/intern_bloc.dart';
import 'blocs/intern_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InternBloc()..add(LoadInternData()),
      child: MaterialApp(
        title: 'Intern Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const LoginPage(),
      ),
    );
  }
}
