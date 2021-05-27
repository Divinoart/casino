import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:casino/const.dart';
import 'package:casino/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NavDrawer extends StatefulWidget {
  // final Function function;
  // final Function function2;
  // final Function function3;
  // final Function function4;
  //
  //
  // NavDrawer({
  //   @required this.function,
  //   @required this.function2,
  //   @required this.function3,
  //   @required this.function4,
  // });
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  var token;
  String _name, _email;
  bool _visible = false;
  bool _visible3 = false;
  bool _visible2 = false;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'));
    print('token is Bearer $token');
  }

  _loadUserData() async {
    await _getToken();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    print('printing user details');
    print(user);
    print(user['email']);
    print(user['name']);

    setState(() {
      _name = user['name'];
      _email = user['email'];

    });
  }

  @override
  void initState() {
    _getToken();
    _loadUserData();
    super.initState();
//    _loadUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          DrawerHeader(
              margin: const EdgeInsets.only(bottom: 0.0),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
//                  image: DecorationImage(
//                      fit: BoxFit.fill,
//                      image: AssetImage('')
//                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome', style: TextStyle(fontWeight: FontWeight.w400),),


                              // Text((_email != null)? _email : 'abituser.com' , style: TextStyle( fontSize: 10),),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              // color: Colors.red,
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(75.0),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
                                  placeholder: (context, url) => Image(image: AssetImage("assets/images/loading.gif",), fit: BoxFit.cover,),
                                  // errorWidget: (context, url, error) => Image(image: AssetImage("assets/images/avatar2.png",)),
                                ),


                                // Center(child: Image(image: AssetImage("assets/images/avatar2.png",))),
                              ),
                            ),
                            SizedBox(height: 6,),

                          ],
                        )
                      ],
                    ),

                    SizedBox(height: 5,),

                  ],
                ),
              )

          ),

          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),),
            ),
          ),

          ListTile(
            onTap:
              Provider.of<AppProvider>(context).theme == Constants.lightTheme?
              () {
                Provider.of<AppProvider>(context, listen: false)
                    .setTheme(Constants.darkTheme, "dark");
              } : () {
                Provider.of<AppProvider>(context, listen: false)
                    .setTheme(Constants.lightTheme, "light");

            },
            leading: Icon( Provider.of<AppProvider>(context).theme == Constants.lightTheme? Icons.brightness_2 : Icons.brightness_high_rounded, ),
            // trailing: Switch(
            //   value: Provider.of<AppProvider>(context).theme == Constants.lightTheme
            //       ? false
            //       : true,
            //   onChanged: (v) async{
            //     if (v) {
            //       Provider.of<AppProvider>(context, listen: false)
            //           .setTheme(Constants.darkTheme, "dark");
            //     } else {
            //       Provider.of<AppProvider>(context, listen: false)
            //           .setTheme(Constants.lightTheme, "light");
            //     }
            //   },
            //   activeColor: Theme.of(context).accentColor,
            // ),
            title: Text(Provider.of<AppProvider>(context).theme == Constants.lightTheme? 'Dark Mode' : "Light Mode",style: TextStyle(fontWeight: FontWeight.w600),),
          ),

          // ListTile(
          //   onTap: (){
          //     // pushNewScreen(
          //     //   context,
          //     //   screen: MyScholarshipPage(),
          //     //   withNavBar: true, // OPTIONAL VALUE. True by default.
          //     //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
          //     // );
          //   },
          //   leading: Icon( Icons.brightness_medium, ),
          //   trailing: Switch(
          //     value: Provider.of<AppProvider>(context).theme == Constants.lightTheme
          //         ? false
          //         : true,
          //     onChanged: (v) async{
          //       if (v) {
          //         Provider.of<AppProvider>(context, listen: false)
          //             .setTheme(Constants.darkTheme, "dark");
          //       } else {
          //         Provider.of<AppProvider>(context, listen: false)
          //             .setTheme(Constants.lightTheme, "light");
          //       }
          //     },
          //     activeColor: Theme.of(context).accentColor,
          //   ),
          //   title: Text(Provider.of<AppProvider>(context).theme == Constants.lightTheme? 'Dark Mode' : "Light Mode",style: TextStyle(fontWeight: FontWeight.w600),),
          // ),

          ListTile(
            onTap: (){
              // pushNewScreen(
              //   context,
              //   screen: MyScholarshipPage(),
              //   withNavBar: true, // OPTIONAL VALUE. True by default.
              //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
              // );
            },
            title: Text('Help and Feedback',style: TextStyle(fontWeight: FontWeight.w600),),
          ),

          SizedBox(height: 60,),

          FlatButton(onPressed: () {
            logout();
            print('user logged out');
          }, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Exit App", style: TextStyle(color: Colors.white),),
          ),
            color: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          )


        ],
      ),
    );
  }
  void logout() async{
    SystemNavigator.pop();
 }
}
