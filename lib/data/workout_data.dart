import 'package:fit/models/exercise.dart';
import 'package:fit/models/workout.dart';
import 'package:flutter/cupertino.dart';

class WorkoutData extends ChangeNotifier {
  /*

    WORKOUT DATA STRUCTURE

    -This overall list contains the different workouts
    -Each workout has a name and a list of exercises


  */

  List<Workout> workoutList = [
    // default workout
    Workout(
      name: "Upper Body",
      exercises: [
        Exercise(name: "Bicep Curl", weight: "10", reps: "12", sets: "3"),
      ],
    ),
    Workout(
      name: "Lower Body",
      exercises: [
        Exercise(name: "Bicep Curl", weight: "10", reps: "12", sets: "3"),
      ],
    ),
  ];

  // get list of workouts
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  // get length of a given workout
  int numberOfExercisesInWorkout(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    return relevantWorkout.exercises.length;
  }

  // add a workout
  void addWorkout(String name) {
    // add a new workout with a blank list of exercises
    workoutList.add(Workout(name: name, exercises: []));

    notifyListeners();
  }

  // add exercise to a workout
  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    // find relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    relevantWorkout.exercises.add(Exercise(
      name: exerciseName,
      weight: weight,
      reps: reps,
      sets: sets,
    ));

    notifyListeners();
  }

  // check off exercise
  void checkOffExercise(String workoutName, String exerciseName) {
    // find relevant workout and relevant exercise
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

    // check off boolean to show user completed the exercise
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
    notifyListeners();
  }

// return relevant workout object given a workout name
  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);

    return relevantWorkout;
  }

// return relevant exercise object given a workout name + exercise
  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);

    return relevantExercise;
  }
}
