import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_clone/helper/utils.dart';

class WelcomeScreen extends StatefulWidget {
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: Text(
                    "Welcome To WhatsApp",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20.0),
                  ),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/hero.png',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Read our ',
                            style: TextStyle(
                                color: Color(Utils.hexToInt("8a000000")),
                                fontSize: 12.0)),
                        TextSpan(
                            text: 'Privacy Policy',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchURL(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: '. Tap "Agree and continue" to accept the ',
                            style: TextStyle(
                                color: Color(Utils.hexToInt("8a000000")),
                                fontSize: 12.0)),
                        TextSpan(
                            text: 'Terms of Service',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => _launchURL(),
                            style:
                                TextStyle(color: Colors.blue, fontSize: 12.0))
                      ]),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 300.0),
                    child: RaisedButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'AGREE AND CONTINUE',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              '/phone', ModalRoute.withName('/phone')),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
