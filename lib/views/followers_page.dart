import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/monitoring_service.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({Key? key}) : super(key: key);

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  bool loading = true;
  List<UserModel> allUsers = [];

  GitHubService service = GitHubService();
  void inicialize() {
    var name = ModalRoute.of(context)!.settings.arguments;
    service.getUsers(name: name as String).then((value) {
      setState(() {
        allUsers = value;
        loading = false;
      });
    }).catchError((_) {
      print('erro');
    });
  }

  @override
  void didChangeDependencies() {
    inicialize();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Seguidores'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                loading
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          ...allUsers.map(
                            (e) => Card(
                              key: Key(e.id.toString()),
                              child: ListTile(
                                leading: Image.network(e.avatarUrl),
                                title: Text(e.login),
                              ),
                            ),
                          )
                        ],
                      ),
              ],
            ),
          )),
        ));
  }
}
