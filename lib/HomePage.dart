import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';





class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RemoteConfig remoteConfig = RemoteConfig.instance;
  String _name, _email;
  var token;
  bool _isLoading = true;


  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    print('token is Bearer $token');
  }



  _loadUserData() async {
    await _getToken();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    print('printing user details');
    print(user);
    print(user['email']);
    print(user['firstname']);

    setState(() {
      _name = user['name'].toString();
      _email = user['email'];

    });
  }

  @override
  void initState() {
    super.initState();
    // _getToken();
    // _loadUserData();
  }
  @override
  Widget build(BuildContext context) {
    String url = 'https://newsmarch.club/';
    return Scaffold(

      body:
      SafeArea(
        bottom: true,
        top: true,
        child: Stack(
          children: [
            WebView(
              initialUrl: remoteConfig.getValue('url').asString(),
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                setState(() {
                  _isLoading = false;
                });
                print('Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
            ),

            buildLoading(),

          ],
        ),
      ),


//      Tawk(
//        directChatLink: 'https://tawk.to/chat/5f664ae1f0e7167d0011e412/default/',
//        visitor: TawkVisitor(
//          name: _name,
//          email: _email,
//        ),
//        onLoad: () {
//          print('Hello Tawk!***********************************');
//        },
//        onLinkTap: (String url) {
//          print(url);
//        },
// //        placeholder: Center(
// //          child: Text('Loading...'),
// //        ),
//      ),
    );
  }

  Widget buildLoading() {
    return Positioned(
      child: _isLoading
          ? Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),

            ],
          ),
        ),
        color: Colors.white.withOpacity(0.8),
      )
          : Container(),
    );
  }

}
