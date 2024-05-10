import 'package:flutter/material.dart';
import 'package:uts/home.dart';
import 'package:uts/login.dart';
import 'package:uts/ui/main_view.dart';
import 'package:uts/ui/screens/login_screen.dart';
import 'data.dart';
import 'detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Buku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        platform: TargetPlatform.iOS,
      ),
      home: MainView(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  generateRoute(RouteSettings settings) {
    final path = settings.name?.split('/');
    final title = path?[1];

    // Check if the route is for detail page
    {
      // Find the book from the title in the books list
      Book book = books.firstWhere((it) => it.title == title);
      // Return the Detail page with the book
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Detail(book),
      );
    }

    // If the route is not for detail page, return null
  }
}
