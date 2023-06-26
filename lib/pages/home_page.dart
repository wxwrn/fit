import 'package:fit/data/workout_data.dart';
import 'package:fit/pages/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// text controller
  final newWorkoutNameController = TextEditingController();

// create new workout
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create new workout"),
        content: TextField(
          controller: newWorkoutNameController,
        ),
        actions: [
          // save button
          MaterialButton(
            onPressed: save,
            child: const Text("Save"),
          ),

          // cancel button
          MaterialButton(
            onPressed: cancel,
            child: const Text("Cancel"),
          )
        ],
      ),
    );
  }

  // goToWorkoutPage
  void goToWorkoutPage(String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutPage(
          workoutName: workoutName,
        ),
      ),
    );
  }

  void save() {
    // get workout name from text controller
    String newWorkoutName = newWorkoutNameController.text;

    // add workout to workoutdata list
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);

// close/pop dialog box
    Navigator.pop(context);
    clear();
  }

  void cancel() {
// close/pop dialog box
    Navigator.pop(context);
    clear();
  }

  // clear controller
  void clear() {
    newWorkoutNameController.clear();
  }

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
            title: Text(
              value.getWorkoutList()[index].name,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () =>
                  goToWorkoutPage(value.getWorkoutList()[index].name),
            ),
          ),
        ),
      ),
    );
  }
}
