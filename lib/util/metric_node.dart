class MetricNode {

  late final String name;
  bool selected = false;

  MetricNode (this.name);

  bool getSelect () {
    return selected;
  }

  String getName () {
    return name;
  }

  void changeSelected () {
    selected = !selected;
  }

}