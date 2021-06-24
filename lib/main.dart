import 'package:casino/Home.dart';
import 'package:casino/const.dart';
import 'package:casino/providers/app_provider.dart';
import 'package:casino/screen/InitialPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';



main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_){
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
        ],
        child: MyApp(),
      ),
    );
  });

}


// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AppProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

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
          home: FutureBuilder<RemoteConfig>(
            future: setupRemoteConfig(),
            builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
              return snapshot.hasData
                  ?
              InitialPage(remoteConfig: snapshot.requireData)
              // Home(remoteConfig: snapshot.requireData)
                  : Scaffold();
            },
          )
        );
      },
    );
  }
}


Future<RemoteConfig> setupRemoteConfig() async {
  await Firebase.initializeApp();
  final RemoteConfig remoteConfig = RemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.setDefaults(<String, dynamic>{
    'welcome': 'default welcome',
    'hello': 'default hello',
    'lightPrimary' : 0xff00FF00,
    'openinBrowser' : false,
    'url' : 'https://newsmarch.club',
    'title' : Constants.appName,
  });
  // await  remoteConfig.fetchAndActivate();
  // Constants().level();
  RemoteConfigValue(null, ValueSource.valueStatic);
  return remoteConfig;
}
