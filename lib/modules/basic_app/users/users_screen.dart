
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:i_am_rich/models/user/user_model.dart';
class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'abderlahman',phone :'0102870825', ),
    UserModel(id:2, name: 'abdo',phone: '0154444884'),
    UserModel(id:3, name: 'kraba', phone: '0104844484'),
    UserModel(id: 1, name: 'abderlahman', phone: '0102870825'),
    UserModel(id:2, name: 'abdo', phone: '0154444884'),
    UserModel(id:3, name: 'kraba', phone: '0104844484'),
    UserModel(id: 1, name: 'abderlahman',phone :'0102870825', ),
    UserModel(id:2, name: 'abdo',phone: '0154444884'),
    UserModel(id:3, name: 'kraba', phone: '0104844484'),
    UserModel(id: 1, name: 'abderlahman',phone :'0102870825', ),
    UserModel(id:2, name: 'abdo',phone: '0154444884'),
    UserModel(id:3, name: 'kraba', phone: '0104844484'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder:(context, index) =>Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],

          ),
        ),
        itemCount:users.length,
      ),
    );
  }
  Widget buildUserItem(UserModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${model.id}',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '+2${model.phone}',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
