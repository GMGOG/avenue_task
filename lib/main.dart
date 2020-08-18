import 'package:avenue_task/screens/HomeScreen.dart';
import 'package:avenue_task/screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:avenue_task/BLoC/TrendingBloC.dart';

void main() {
  runApp(AvenueApp());
}

class AvenueApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AvenueAppState createState() => _AvenueAppState();
}

class _AvenueAppState extends State<AvenueApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingImagesBloc.fetchTrendingPhotos(1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        'search': (context) => SearchScreen(),
      },
    );
  }
}
