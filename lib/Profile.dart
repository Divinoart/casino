
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}


class _UserProfileState extends State<UserProfile> {
  final RemoteConfig remoteConfig = RemoteConfig.instance;
  String _name, _email;

  @override
  void initState() {
    // _getUser();
    // TODO: implement initState
    super.initState();
  }

  _getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final String user = localStorage.getString('user');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            // color: Colors.red,
                            height: 90,
                            width: 90,
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
                          // SizedBox(height: 6,),
                          // Text('Game ID: ' , style: TextStyle( fontSize: 10),),
                        ],
                      ),
                      SizedBox(width: 20,),
                      // Row(
                      //   children: [
                      //     Column(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text('Welcome', style: TextStyle(fontWeight: FontWeight.w400),),
                      //
                      //         Padding(
                      //           padding: const EdgeInsets.symmetric(vertical:3.0),
                      //           child: Row(
                      //             children: [
                      //               Flexible(child: Text("", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),maxLines: 1, overflow: TextOverflow.ellipsis,)),
                      //             ],
                      //           ),
                      //         ),
                      //
                      //         // Text((_email != null)? _email : 'abituser.com' , style: TextStyle( fontSize: 10),),
                      //         SizedBox(height: 3,),
                      //         Text('TAT Bal : 700',  style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.w800),),
                      //       ],
                      //     ),
                      //   ],
                      // ),

                    ],
                  ),

                  SizedBox(height: 5,),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), offset: Offset(0, 3), blurRadius: 10)],
              ),
              child: ListView(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                shrinkWrap: true,
                primary: false,
                children: <Widget>[
                  ListTile(
                    dense: false,
                    leading: Icon(Icons.person),
                    title: Text(
                      "Account Information",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    // trailing:InkWell(
                    //     // onTap: (){_showDialog();},
                    //     child: Icon(Icons.edit)) ,
// this place for data update


                  ),
                  ListTile(
                    onTap: () {},
                    dense: true,
                    title: Text(
                      "Current Version",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: Text(
                      remoteConfig.getValue('title').asString(),
                      style: TextStyle(),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    dense: true,
                    title: Text(
                      "links",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: Text(
                      remoteConfig.getValue('url').asString(),
                      style: TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  ListTile(
                    onTap: () {},
                    dense: true,
                    title: Text(
                      "Version",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: Text(
                      "1.0.3" ,
                      style: TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ),
                ],
              ),
            ),
//
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.15), offset: Offset(0, 3), blurRadius: 10)],
              ),
              child: ListView(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                shrinkWrap: true,
                primary: false,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      "App setting",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
//                                        trailing: IconButton(
//                                          icon: Icon(Icons.edit_attributes),
//                                          onPressed: (){},
//                                        )
                  ),
                  ListTile(
//                                      onTap: () {
//                                        Navigator.of(context).pushNamed('/Languages');
//                                      },
                    dense: true,
                    title: Row(
                      children: <Widget>[
                        Icon(
                          Icons.translate,
                          size: 22,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "languages",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    trailing: Text(
                      "english",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  ListTile(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context){
                      //   return Contact();
                      // }));
                    },
                    dense: true,
                    title: Row(
                      children: <Widget>[
                        Icon(
                          Icons.help,
                          size: 22,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "FAQ & Support",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
