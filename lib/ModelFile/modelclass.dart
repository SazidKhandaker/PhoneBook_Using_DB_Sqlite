class Modelclass {
  int? id;
  String name;
  String phone;

  Modelclass({this.id, required this.name, required this.phone});

  factory Modelclass.fromMap(Map<String, dynamic> obj) =>
      Modelclass(id: obj['id'], name: obj['name'], phone: obj['phone']);

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'phone': phone};
}
