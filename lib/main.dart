<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:speedometer/speedo_meter.dart';
import 'package:speedometer/stress_meter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home:  StressMeterScreen(),
    );
  }
}

=======
// lib/main.dart

import 'package:flutter/material.dart';
import 'package:neosao_t/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'screens/user_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserListScreen(),
      ),
    );
  }
}
>>>>>>> 980d2eb (Initial commit)
