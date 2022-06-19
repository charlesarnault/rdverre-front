import 'package:flutter/material.dart';
import 'multi_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Form',
      theme: theme.copyWith(
        platform: TargetPlatform.iOS,
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue,
          secondary: Color(0xFF1DCC8C),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MultiForm(),
    );
  }
}
