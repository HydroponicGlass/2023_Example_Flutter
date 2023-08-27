class TestTable{
  final int? id;
  final String? name;
  final int? value;

  TestTable({this.id, this.name, this.value});

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'value': this.value,
  };

  @override
  String toString() {
    return 'TestTable{id: $id, name: $name, value: $value}';
  }
}