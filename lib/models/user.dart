class User {
  final String name;
  final int age;
  final List<String> profesiones;

  User({required this.name, required this.age, this.profesiones = const []});

  User copyWith({String? name, int? age, List<String>? profesiones}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      profesiones: profesiones ?? this.profesiones,
    );
  }
}
