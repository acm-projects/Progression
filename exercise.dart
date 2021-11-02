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

  _setWeight(int w){
    this.weight = w;
  }
  _setReps(int r){
    this.reps = r;
  }
  _setDone(){
    this.didExercise = !this.didExercise;
  }
  getWeight(){
    return weight;
  }
  getReps(){
    return reps;
  }
}

