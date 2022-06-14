import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CHI Test',
      initialRoute: '/',
      routes: appRoutes,
    ),
  );
}
