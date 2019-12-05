import 'package:flutter/material.dart';
import 'package:navigation_state_restoration/pages/page_two.dart';

class PageOne extends StatelessWidget {
  static const String name = '/page1';

  String data;


  PageOne({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Page 1')
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Page 1'),
            subtitle: Text('click to navigate to Page 2'),
            onTap: () => Navigator.of(context).pushNamed(PageTwo.name),
            trailing: Icon(Icons.arrow_forward_ios)
          ),
          if (data != null && data.isNotEmpty)
            ListTile(
                title: Text('Data received as param'),
                subtitle: Text(data),
            ),
        ],
      ),
    );
  }
}
