import 'package:fit/data/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Create new workout"),
        content: TextField(),
        actions: [
          // save button
          MaterialButton(
            onPressed: save,
            child: Text("Save"),
          )

          // cancel button
          MaterialButton(onPressed: cancel,
          child: Text("Cancel"),)
        ],
      ),
    );
  }


  void save() {

  }

  void cancel() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Workout Tracker"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: createNewWorkout, child: const Icon(Icons.add)),
        body: ListView.builder(
          itemCount: value.getWorkoutList().length,
          itemBuilder: (context, index) => ListTile(
            title: Text(value.getWorkoutList()[index].name),
          ),
        ),
      ),
    );
  }
}
