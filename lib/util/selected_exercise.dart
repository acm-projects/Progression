
class SelectedExercise {
  SelectedExercise({required this.name, this.selected = false});

  String name;
  bool selected;

  void changeSelected () {
    selected = !selected;
  }
}