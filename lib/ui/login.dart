import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}


class LoginState extends State<Login> {

  // Strings to hold the input data from TextFields
  String _strUser = "Nothing";
  String _strPasswd = "Empty";

  // ignore: slash_for_doc_comments
  /**************** _userController ********************/
  final TextEditingController _userController = new TextEditingController();

  // ignore: slash_for_doc_comments
  /************************* _passwdController ****************************/
  final TextEditingController _passwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white70,

      /******** APPBAR *******/
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),

      /********** BODY ***********/
      body: new Container(
        alignment: Alignment.topCenter,
//        child: new Column(
      // Used ListView to permit view to be scroll
        child: new ListView(
          children: <Widget>[

            //****** Image *****//
            new Image.asset(
              'images/face.png',
              width: 200.0,
              height: 150.0,
              color: Colors.white,
            ),
//                        new Image.asset('images/face.png', width: 200.0,height: 200.0,color: Colors.purpleAccent,),

            //******* FORM *******//
            new Container( //Form
              padding: new EdgeInsets.all(12.0),
//                          height: 100.0,
//                          width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  // ****** USER NAME ****** //
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: "USER NAME",
                        icon: new Icon(Icons.perm_identity)),
                  ),

                  // ****** PASSWD ****** //
                  new TextField(
                    controller: _passwdController,
                    decoration: new InputDecoration(
                        hintText: "PASSWORD", icon: new Icon(Icons.lock_open)),
                  ),

                  // ****** BUTTONS ****** //
                  new Center(
                    // the Idea is add a Expanded empty widget between the Button
                    // to Center it.
                    child: new Row(
                      // Display Horizontal
                      children: <Widget>[

                        // Empty Space
                        new Expanded(child: new Container()),

                        // LOGIN BUTTON
                        new Container(
                          margin: new EdgeInsets.only(top: 25.0,),
                          padding: new EdgeInsets.all(10.0),
                          child: new RaisedButton(
                            //onPressed: () => debugPrint("test"),
                            onPressed: _welcomeStr,
                            color: Colors.lightBlueAccent,
                            child: new Text(
                              "LOGIN",
                              style: new TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ),

                        // Empty Space
                        new Expanded(child: new Container()),

                        // Clear BUTTON
                        new Container(
                          margin: new EdgeInsets.only(top: 25.0,),
                          padding: new EdgeInsets.all(15.0),
                          child: new RaisedButton(
                            //onPressed: () => debugPrint("test"),
                            onPressed: _cls, // method _cls called to clear fields
                            color: Colors.lightBlueAccent,
                            child: new Text("CLEAR",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ),

                        // Empty Space
                        new Expanded(child: new Container()),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Space between Output Text and Form container
            new Padding(padding: EdgeInsets.all(14.0)),

            //****** Output Display Text ******//
            new Row( // Output Display Text
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[

                   new Text("$_strUser! your Passworld is $_strPasswd",
                     style: new TextStyle(
                          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500
                     ),
                   )
                 ],
            )


          ],
        ),
      ),
    );
  } //build


   // ignore: slash_for_doc_comments
   /** ************* _cls() ******************** **/
   void _cls(){
       setState(() {
            _userController.clear();
            _passwdController.clear();
       });
   }

   // ignore: slash_for_doc_comments
   /**  ********************** _welcomeStr() ************************ **/
   void _welcomeStr(){
       setState(() {
            if(_userController.text.isNotEmpty) _strUser = _userController.text;
            if(_passwdController.text.isNotEmpty) _strPasswd = _passwdController.text;
       });
   }

}
