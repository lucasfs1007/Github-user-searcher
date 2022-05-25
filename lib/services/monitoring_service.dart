import 'package:dio/dio.dart';
import 'package:monitoring_app/models/user_model.dart';
//Devo pegar quais apis vou usar e brincar aqui, esse dio da uns icons legais.

class GitHubService {
  Future<UserModel> getUserByName(String name) async {
    try {
      Response response = await Dio().get("https://api.github.com/users/$name");
      print(response.statusCode);
      return UserModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsers({String name = "lucasfs1007"}) async {
    try {
      Response response =
          await Dio().get("https://api.github.com/users/$name/followers");

      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
