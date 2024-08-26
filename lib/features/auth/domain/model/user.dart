import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

User deserializeUser(Map<String, dynamic> json) => User.fromJson(json);
Map<String, dynamic> serializeUser(User object) => object.toJson();

@Freezed(fromJson: true, toJson: true)
class User with _$User {
  factory User({
    String? id,
    String? name,
    String? email,
    String? password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
