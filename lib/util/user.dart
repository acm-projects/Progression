
class User {

  final String name;
  final bool rememberMe;

  User({required this.name, required this.rememberMe});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        rememberMe = json['rememberMe'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rememberMe'] = rememberMe;
    return data;
  }
}
