import 'package:fit/data/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
