class UserModel {
  String id;
  String name;

  UserModel({required this.id, required this.name});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(id: data['id'], name: data['name']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
