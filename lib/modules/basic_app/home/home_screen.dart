// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: () {
              print('abdo');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print('mohamed');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
          [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://www.ssla.co.uk/wp-content/uploads/2020/08/robot-300x300.jpg'
                      ),
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(.6),
                      width: 200,
                      padding: EdgeInsetsDirectional.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'Robot',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(
                          'https://www.ssla.co.uk/wp-content/uploads/2020/08/robot-300x300.jpg'
                      ),
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(.6),
                      width: 200,
                      padding: EdgeInsetsDirectional.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'Robot',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
