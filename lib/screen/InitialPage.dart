//import 'package:Kashflow/Widgets/AnimatedBottomNavBar.dart';
//import 'package:Kashflow/screen/ExpenseSummary.dart';
//import 'package:Kashflow/screen/HomePage.dart';
//import 'package:Kashflow/screen/RevenueSummary.dart';
import 'package:casino/Helper/Movimentacoes_helper.dart';
import 'package:casino/Widgets/AnimatedBottomNavBar.dart';
import 'package:casino/screen/ExpenseSummary.dart';
import 'package:casino/screen/HomePage.dart';
import 'package:casino/screen/RevenueSummary.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class InitialPage extends StatefulWidget {
  InitialPage({
    @required this.remoteConfig,
  });

  final RemoteConfig remoteConfig;

  final List<BarItem> barItems = [
    
    BarItem(
      text: "Expenses",
      iconData: Icons.remove_circle_outline,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "",
      iconData:  FontAwesomeIcons.envira,
//      iconData:  Icons.home,
      color: Colors.indigo,
    ),
    
    BarItem(
      text: "Revenue",
      iconData: Icons.add_circle_outline,
      color: Colors.teal,
    ),
    /*BarItem(
      text: "Search",
      iconData: Icons.search,
      color: Colors.yellow.shade900,
    ),
    */
  ];

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  int selectedBarIndex = 1;
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _launchURL(_url) async =>
      await canLaunch(_url) ? await launch(_url) : _showMsg('cannot launch $_url');


  _getConfig()async{
    try {
      // Using zero duration to force fetching from remote server.
      await widget.remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));

      await  widget.remoteConfig.fetchAndActivate();
      print('********************');
      print(widget.remoteConfig.getBool('openinBrowser'));
      if(widget.remoteConfig.getBool('openinBrowser')){
        _launchURL(widget.remoteConfig.getValue('url').asString());
      }
      // Constants().level();
    } on PlatformException catch (exception) {
      // Fetch exception.
      print(exception);
    } catch (exception) {
      print(
          'Unable to fetch remote config. Cached or default values will be '
              'used');
      print(exception);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    _getConfig();
    super.initState();
  }
  
  

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.lightBlue[700], // navigation bar color
    //statusBarColor: Colors.lightBlue[700],
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light // status bar color
  ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    

    List<Widget> screens =[
      
      ExpensesSummary(),
      HomePage(),
      RevenueSummary()
    ];

    //_allMov();
    //print("\nMes atual: " + DateTime.now().month.toString());
    return Scaffold(
      key: _scaffoldKey,
      body: screens[selectedBarIndex],
      bottomNavigationBar: AnimatedBottomBar(
        barItems: widget.barItems,
          animationDuration: const Duration(milliseconds: 150),
          barStyle: BarStyle(
            fontSize: width * 0.045,
            iconSize: width * 0.07
          ),
          onBarTap: (index){
            setState(() {
              selectedBarIndex = index;
            });
          },
      ),

    );
  }
}
