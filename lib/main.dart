import 'package:app/pages/Init.dart';
import 'package:app/pages/comercial/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'bloc/global_keys_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<GlobalKeysModel>(
      model: GlobalKeysModel(),
      child: MaterialApp(
        routes: {
          "/Init": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
          "/Comercial": (context) => Comercial(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Prueba',
        home: Comercial(),
      ),
    );
  }
}


