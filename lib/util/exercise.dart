class Exercise {
  final String name;
  int weight;
  int reps;
  bool didExercise = false;

  Exercise ({
    required this.name,
    this.weight = 0,
    this.reps = 0,
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
  getWeight(){
    return weight;
  }
  getReps(){
    return reps;
  }
}
