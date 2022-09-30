import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  String email;
  String firstname;
  String lastname;

  AppUser({
    this.email = '',
    this.firstname = '',
    this.lastname = '',
  });

  /// Connect the generated [_$UserFromJson] function to the `fromJson` factory.
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
