import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? familyId;
  final bool paired;
  final String firstName;
  final String lastName;

  const UserModel({
    required super.uid,
    required super.email,
    required super.role,
    required this.familyId,
    required this.paired,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
      email: json["email"],
      role: json["role"],
      familyId: json["familyId"],
      paired: json["paired"] ?? false,
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
    );
  }
}