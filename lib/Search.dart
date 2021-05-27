import 'package:flutter/material.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool _visible2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Row(
                  children: [
                    Text("About", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              Text("Games available in most casinos are commonly called casino games. In a casino game, the players gamble cash or casino chips on various possible random outcomes or combinations of outcomes. Casino games are also available in online casinos, where permitted by law."),


              SizedBox(height: 20,),


              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 8,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 200.0,
                          // color: Colors.red,
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image(
                              image: AssetImage("assets/images/map.jpeg",),
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width,
                            )
//                    Image.asset('assets/images/map.jpg'),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.all(0.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),

                            child: IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => map()),
                                  // );

                                }
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '+1200',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.display1.copyWith(
                                  color: Colors.orange,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                              ),
                              Text(
                                'Customers',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 10.0,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '578',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.display1.copyWith(
                                  color: Colors.purple[300],
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                              ),
                              Text(
                                'Products',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,

                                style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 10.0,
                                  color: Colors.purple[300],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '15+',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.display1.copyWith(
                                  color: Colors.lightBlue,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                              ),
                              Text(
                                'Brands Serviced',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 10.0,
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: _visible2? (){
                  setState(() {
                    _visible2 = false;
                  });
                }: (){
                  setState(() {
                    _visible2 = true;
                  });
                },
                // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                leading:
                _visible2? null:
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color:Theme.of(context).accentColor.withOpacity(0.2),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon( Icons.question_answer_rounded, size: 20, color: Theme.of(context).accentColor,),
                    )),
                title: Row(
                  children: [
                    Expanded(child: Text('Contact Info')),
                    Icon(_visible2? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  ],
                ),
              ),
              _supportVisibility(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _supportVisibility(){
    return Visibility(
      visible: _visible2,
//              maintainAnimation: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Contact Details'),
                  ),
                ],
              ),
              Row(
                children: [
                  // Flexible(
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       _launchURL('https://wa.link/utee7b');
                  //     },
                  //     child: Row(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Image(image: AssetImage('assets/images/whatsapp.png'), height: 30, width: 30,),
                  //         ),
                  //         Text('Whatsapp')
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Flexible(
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       _launchURL('https://telegram.org/');
                  //     },
                  //     child: Row(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Image(image: AssetImage('assets/images/telegram.png'), height: 30, width: 30,),
                  //         ),
                  //         Text('Telegram')
                  //
                  //       ],
                  //     ),
                  //   ),

                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Email'),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      // onTap: (){
                      //   _launchURL('mailto:support@casino?subject=Support&body=support');
                      // },
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.mail, size: 20, color: Theme.of(context).accentColor,),
                                ),
                              )),
                          Text('support@casino.app', style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w600),)

                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Phone'),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    // onTap: (){
                    //   _launchURL('tel:+25765362526');
                    // },
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.call, color: Theme.of(context).accentColor,),
                              ),
                            )),
                        Text('+25765362526',)

                      ],
                    ),
                  ),
                  GestureDetector(
                    // onTap: (){
                    //   _launchURL('tel:+18017017222');
                    // },
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.redAccent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.call, color: Theme.of(context).accentColor,),
                              ),
                            )),
                        Text('+1-8432-2343',)

                      ],
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}
