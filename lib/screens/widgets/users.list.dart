import 'package:flutter/material.dart';
import 'package:untitled3/model/user.model.dart';
import 'package:untitled3/repository/user.repo.dart';

class ListUsers extends StatefulWidget {
  final List<User> users;

  ListUsers({required this.users});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    final users = widget.users;
    final _ctrupdatename = TextEditingController();
    final _ctrupdateage = TextEditingController();

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text(user.name.substring(0, 2).toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            title: Text(user.name),
            subtitle: Text('Age: ${user.age}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    _ctrupdatename.text = user.name;
                    _ctrupdateage.text = user.age.toString();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Update: ${user.name}'),
                        content: SingleChildScrollView(
                          child: Container(
                            height: 250,
                            child: Column(
                              children: [
                                TextField(
                                  style: const TextStyle(fontSize: 22, color: Colors.pink),
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                                  ),
                                  controller: _ctrupdatename,
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  style: const TextStyle(fontSize: 22, color: Colors.pink),
                                  decoration: const InputDecoration(
                                    labelText: 'Age',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                                  ),
                                  controller: _ctrupdateage,
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                   final user = User(id: users[index].id,
                                            name: _ctrupdatename.text,age: int.parse(_ctrupdateage.text)
                                   );
                                   updateUser(user);
                                  },
                                  child: const Text('Update'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, 'Annuler');
                            },
                            child: const Text('Annuler'),
                          )
                        ],
                      ),
                    );
                  },
                  child: const Icon(Icons.edit, size: 32, color: Colors.green),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Voulez-vous supprimer ${users[index].name}?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              deleteUser(users[index].id);
                              Navigator.pop(context, 'oui');
                            },
                            child: Text('Oui'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, 'Annuler');
                            },
                            child: Text('Annuler'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Icon(Icons.delete, size: 32, color: Colors.red),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
