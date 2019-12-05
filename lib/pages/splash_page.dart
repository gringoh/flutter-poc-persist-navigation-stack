import 'package:flutter/material.dart';
import 'package:navigation_state_restoration/pages/page_one.dart';
import 'package:navigation_state_restoration/pages/page_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static const String name = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  String _history;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    loadAsyncData();
  }

  void loadAsyncData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('history') && prefs.getString('history').length > 0) {
      _history = prefs.getString('history');
      print('restored $_history');
      List<String> routes = _history.split('/');
      routes.removeWhere((item) => item.isEmpty);
      routes.forEach((route) {
        if (routes.indexOf(route) == 0) {
          Navigator.pushReplacementNamed(context, '/$route');
        } else {
          Navigator.pushNamed(context, '/$route');
        }
      });
    } else {
      Navigator.pushReplacementNamed(
          context,
          PageOne.name,
          arguments: 'Hello World!',
      );
    }
  }
}

