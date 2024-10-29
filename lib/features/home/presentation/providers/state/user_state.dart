class UserState {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;

  const UserState({this.id, this.name, this.email, this.phone});

  UserState copyWith({String? id, String? name, String? email, String? phone}) {
    return UserState(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
