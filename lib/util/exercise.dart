class Exercise {
  final String name;
  int weight;
  int reps;
  int sets;
  bool didExercise = false;

  Exercise ({
    required this.name,
    this.weight = 0,
    this.reps = 0,
    this.sets = 0
  });

  setWeight(int w){
    weight = w;
  }
  setReps(int r){
    reps = r;
  }
  setSets(int s){
    sets = s;
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
  getSets(){
    return sets;
  }
}