import '../constants/strings.dart';

class UserModel {
  String name;
  String email;
  bool isCitizen;
  String nationalId;

  UserModel({
    required this.name,
    required this.email,
    required this.isCitizen,
    required this.nationalId,
  });

  Map<String, dynamic> asMap() {
    return {
      AppStrings.nameField: name,
      AppStrings.emailField: email,
      AppStrings.isCitizenField: isCitizen,
      AppStrings.nationalIdField: nationalId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map[AppStrings.nameField],
      email: map[AppStrings.emailField],
      isCitizen: map[AppStrings.isCitizenField],
      nationalId: map[AppStrings.nationalIdField],
    );
  }
}
