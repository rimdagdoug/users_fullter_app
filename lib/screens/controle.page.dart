import 'package:flutter/material.dart';
import 'package:untitled3/screens/allusers.page.dart';
import 'package:untitled3/screens/user.add.dart';
class ControlePage extends StatelessWidget {
  const ControlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Gestion des utilisateur'),
            bottom: TabBar(
              tabs: const [
                Tab(icon: Icon(Icons.supervised_user_circle_sharp,size: 28,),text: 'Add',),
                Tab(icon: Icon(Icons.edit_attributes,size: 28,),text: 'Users',),
                Tab(icon: Icon(Icons.search,size: 28,),text: 'Add',)
              ],),
          ),
          body: TabBarView(
            children: const [
              AddUserPage(),
              AllUsers(),
              Center(child: Text('Page3'),),
            ],
          ),
        ));
  }
}
