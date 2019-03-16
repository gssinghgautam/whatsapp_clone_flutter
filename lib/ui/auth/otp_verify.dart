import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/helper/constant.dart';
import 'package:whatsapp_clone/helper/utils.dart';

class OTPVerifyScreen extends StatefulWidget {
  _OTPVerifyScreenState createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  String phoneNumber = "+91 8130940149";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Verify $phoneNumber',
            style: TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              icon:
                  Icon(Icons.more_vert, color: Color(Utils.primaryTextColor())),
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ]),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Waiting to automatically detect an SMS sent to\n',
                    style: TextStyle(
                        color: Color(Utils.primaryTextColor()),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0)),
                TextSpan(
                    text: "$phoneNumber. ",
                    style: TextStyle(
                        color: Color(Utils.primaryTextColor()),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0)),
                TextSpan(
                    text: "Wrong Number?",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0))
              ]),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150.0,
                child: TextField(
                  maxLength: 6,
                  onChanged: (String value) {
                    if (value.length == 6) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', ModalRoute.withName('/home'));
                    }
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: "- - -  - - -",
                      hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(Utils.secondaryTextColor()),
                          fontWeight: FontWeight.w400)),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  label: Text(
                    'Resend SMS',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0),
                  ),
                  icon: Icon(
                    Icons.message,
                    color: Colors.grey,
                    size: 17.0,
                  ),
                  onPressed: () => print('Hello'),
                ),
                Text("02:00",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0))
              ],
            ),
          ),
          Divider(
            height: 0.0,
            color: Colors.grey,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  label: Text(
                    'Call me',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0),
                  ),
                  icon: Icon(
                    Icons.call,
                    color: Colors.grey,
                    size: 17.0,
                  ),
                  onPressed: () => print('Hello'),
                ),
                Text("02:00",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0))
              ],
            ),
          )
        ],
      ),
    );
  }
}
