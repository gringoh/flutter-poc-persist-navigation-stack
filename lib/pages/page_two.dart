import 'package:flutter/material.dart';
import 'package:navigation_state_restoration/pages/page_three.dart';

class PageTwo extends StatelessWidget {
  static const String name = '/page2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2')
      ),
      body: ListTile(
        title: Text('Page 2'),
        subtitle: Text('click to navigate to Page 3'),
        onTap: () => Navigator.of(context).pushNamed(PageThree.name),
        trailing: Icon(Icons.arrow_forward_ios)
      ),
    );
  }
}
