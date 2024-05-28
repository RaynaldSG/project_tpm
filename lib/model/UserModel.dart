import 'package:hive/hive.dart';
part 'UserModel.g.dart';

@HiveType(typeId: 0)
class UserModel{

  UserModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  @HiveField(0)
  String? id;

  @HiveField(1)
  final String fullName;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;
}