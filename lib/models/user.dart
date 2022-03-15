enum UserType { particular, professional }

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.createdAt,
  });

  String id;
  String name;
  String email;
  String phone;
  UserType type;
  DateTime createdAt;

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, type: $type, createdAt: $createdAt}';
  }
}
