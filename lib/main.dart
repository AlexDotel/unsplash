import 'package:flutter/material.dart';
import 'package:unsplash/src/pages/homepages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      
      title: 'Material App',

      initialRoute: '/',

      routes: <String, WidgetBuilder>{
        '/'   : ( BuildContext context ) => HomePage()
      }
    );
  }
}