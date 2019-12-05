import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  static const String name = '/page3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Page 3')
      ),
      body: ListTile(
        title: Text('Page 3'),
        subtitle: Text('This is the final page'),
      ),
    );
  }
}
