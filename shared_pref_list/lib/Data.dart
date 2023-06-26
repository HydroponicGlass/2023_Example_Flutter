class Data {
  String name;
  String age;

  Data({
    required this.name,
    required this.age,
  });

  Data.fromMap(Map map)        // This Function helps to convert our Map into our User Object
      : this.name = map["name"],
        this.age = map["age"];

  Map toMap() {               // This Function helps to convert our User Object into a Map.
    return {
      "name": this.name,
      "age": this.age,
    };
  }
}