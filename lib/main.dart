import 'package:casino/Home.dart';
import 'package:casino/const.dart';
import 'package:casino/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child){
        return MaterialApp(
          title: Constants.appName,
          key: appProvider.key,
          navigatorKey: appProvider.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: appProvider.theme,
          darkTheme: Constants.darkTheme,
          home: Home(),
        );
      },
    );
  }
}
