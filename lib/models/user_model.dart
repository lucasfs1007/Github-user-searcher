//Vou consumir a API do github mesmo por enquanto.
class UserModel {
  UserModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });
  late final String login;
  late final int id;
  late final String avatarUrl;

  UserModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}
