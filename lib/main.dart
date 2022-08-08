import 'package:flutter/material.dart';

import 'core/servecis/service_locator.dart';
import 'movies/presentation/ui/screens/movies_screen.dart';

void main() {
  ServicesLocator().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MainMoviesScreen()
    );
}
