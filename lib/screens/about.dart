import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class About extends StatelessWidget {
  static const routeName = '/about';
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App Developed for Sixth Semester Ecommerce Project Work'),
            SizedBox(height: 19),
            Icon(
              Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}
