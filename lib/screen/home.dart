import 'package:flutter/material.dart';
import 'package:flutter_restapi/model/user.dart';
import 'package:flutter_restapi/services/user_api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<dynamic> users = [];
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API CALL'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            final name = user.fullName;
            final imageUrl = user.picture.thumbnail;
            final color = user.gender == 'male' ? Colors.blue: Colors.pink;
            // final email = user['email'];
            // final name = user['name']['first'];
            // final imageUrl = user['picture']['thumbnail'];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(imageUrl),
              ),
              title: Text(name),
              subtitle: Text(user.dob.date.toString()),
            );
          }),
      // floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserAPI.fetchUsers();
    setState(() {
      users = response;
    });
  }

  
}
