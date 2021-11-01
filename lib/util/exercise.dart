class Exercise {
  final String name;
  int weight = 0;
  int reps = 0;
  bool didExercise = false;

  Exercise ({
    required this.name,
  });

  setWeight(int w){
    weight = w;
  }
  setReps(int r){
    reps = r;
  }
  setDone(){
    didExercise = !didExercise;
  }
}
