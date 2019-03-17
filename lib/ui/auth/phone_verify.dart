import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/helper/constant.dart';
import 'package:whatsapp_clone/helper/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/ui/auth/otp_verify.dart';

class VerifyPhoneScreen extends StatefulWidget {
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  String countryCode = "91";
  String phoneNumber;
  String countryName = 'India';
  String verificationCode;
  String smsCode;
  bool isLoading = false;

  TextEditingController _phoneNumberEditingController,
      _countryCodeEditingController;

  @override
  void initState() {
    super.initState();
    _phoneNumberEditingController = TextEditingController(text: phoneNumber);
    _countryCodeEditingController = TextEditingController(text: countryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Verify your phone number",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon:
                Icon(Icons.more_vert, color: Color(Utils.hexToInt("DE000000"))),
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "WhatsApp will send an SMS message(carrier charges may apply) to verify your phone number.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(Utils.hexToInt("DA000000")),
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
            child: Text("Enter your country code and phone number:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(Utils.hexToInt("DA000000")),
                    fontWeight: FontWeight.w400)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 270.0),
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.white,
                      child: Text(
                        countryName,
                        style: TextStyle(
                            color: Color(Utils.hexToInt("DA000000")),
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () => print('Here'),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Divider(
                  height: 1.0,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 85.0,
                margin: const EdgeInsets.only(right: 16.0, top: 8),
                child: TextField(
                  controller: _countryCodeEditingController,
                  cursorColor: Theme.of(context).primaryColor,
                  textAlign: TextAlign.center,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      prefixText: "+ ",
                      prefixStyle: TextStyle(
                          fontSize: 18.0,
                          color: Color(Utils.primaryTextColor()))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16.0, top: 8),
                width: 195.0,
                child: TextField(
                  controller: _phoneNumberEditingController,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: "phone number",
                      hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Color(Utils.secondaryTextColor()))),
                ),
              )
            ],
          ),
          isLoading
              ? Container(
                  margin: const EdgeInsets.all(80.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      verifyPhone();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve =
        (String verificationCode) {
      this.verificationCode = verificationCode;
      print("PhoneCodeAutoRetrievalTimeout : $verificationCode");
    };

    final PhoneCodeSent smsCodeSent =
        (String verificationId, [int forceCodeResend]) {
      this.verificationCode = verificationId;
      print("smsCodeSent : $verificationCode");
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/otp', ModalRoute.withName('/otp'),
          arguments: OtpScreenArgument(
              phoneNumber:
                  "+${_countryCodeEditingController.text}${_phoneNumberEditingController.text}",
              verificationId: verificationCode));
    };

    final PhoneVerificationCompleted verficationSuccess = (FirebaseUser user) {
      print('Verification Success ${user.uid}');
    };

    final PhoneVerificationFailed verificationFailed = (AuthException auth) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Authentication Error?"),
              content: Text(auth.message),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            );
          });
    };

    setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:
            "+${_countryCodeEditingController.text}${_phoneNumberEditingController.text}",
        timeout: const Duration(seconds: 5),
        verificationCompleted: verficationSuccess,
        verificationFailed: verificationFailed,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent);
  }

  @override
  void dispose() {
    _phoneNumberEditingController.dispose();
    _countryCodeEditingController.dispose();
    super.dispose();
  }
}
