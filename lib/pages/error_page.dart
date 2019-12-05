import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const String name = '/error';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Error')
      ),
      body: Center(
        child: Text('Something is wrong'),
      ),
    );
  }
}
