class Exercise {
  final String name;
  int weight = 0;
  int reps = 0;
  bool didExercise = false;

  Exercise ({
    required this.name,
  });

  _setWeight(int w){
    this.weight = w;
  }
  _setReps(int r){
    this.reps = r;
  }
  _setDone(){
    this.didExercise = !this.didExercise;
  }
}

