import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/ui/screen/cart/checkout_page.dart';
import 'package:cartapp/src/ui/screen/cart/summary.dart';
import 'package:cartapp/src/ui/screen/home/bottom_navigation.dart';
import 'package:cartapp/src/ui/screen/login/sign_up.dart';
import 'package:cartapp/src/ui/screen/order/order_history.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController textEditingControllerEmail = new TextEditingController();
  TextEditingController textEditingControllerPsd = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Color(0xFFFFFFF),
              Color(0xF000008),





            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 120, right: 12),
              child: Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                color: Color(0xFFFFFFFF),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Welcome,",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline1.copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Sign in to Continue",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        FlatButton(onPressed: (){Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));},child:Text(
                          "Sign Up",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color: Color(0xFFFF7600),
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ) ,)

                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    buildTextField(
                        context: context,
                        obscureText: false,
                        textEditingController: textEditingControllerEmail,
                        labelText: "Email"),
                    SizedBox(
                      height: 30,
                    ),
                    buildTextField(
                        context: context,
                        obscureText: true,
                        textEditingController: textEditingControllerPsd,
                        labelText: "Password"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Forgot Password?",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                              color: Color(0xFF000000).withOpacity(.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 12),
                      child: ButtonTheme(
                        height: 40,
                        minWidth: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                HomeNavigation()));
                          },
                          child: Text(
                            "SIGN IN",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white),
                          ),
                          color: Color(0xFFFF7600),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "-OR-",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),

              child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width *
                    .43,
                height: MediaQuery.of(context)
                    .size
                    .height *
                    .06,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey
                            .withOpacity(.24)),
                    borderRadius: BorderRadius.all(
                        Radius.circular(4))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    Expanded(
                      flex:1,
                      child: Center(
                        child:   Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,

                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new CachedNetworkImageProvider(
                                    "https://cdn3.iconfinder.com/data/icons/free-social-icons/67/facebook_square-512.png")),
                          ),
                          width: MediaQuery.of(context).size.height*.04,
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Sign In with Facebook",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1,textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),

              child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width *
                    .43,
                height: MediaQuery.of(context)
                    .size
                    .height *
                    .06,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey
                            .withOpacity(.24)),
                    borderRadius: BorderRadius.all(
                        Radius.circular(4))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    Expanded(
                      flex:1,
                      child: Center(
                        child:  Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,

                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new CachedNetworkImageProvider(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1004px-Google_%22G%22_Logo.svg.png")),
                          ),
                          width: MediaQuery.of(context).size.height*.03,
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Sign In with Google",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1,textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextField buildTextField({BuildContext context,
    bool obscureText,
    TextEditingController textEditingController,
    String labelText}) {
    return TextField(
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      controller: textEditingController,
      onChanged: (_) {},
      style: Theme
          .of(context)
          .textTheme
          .body1
          .copyWith(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: new BorderSide(color: Color(0xFFFF7600))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF7600)),
          ) ,
          labelText: labelText,
          labelStyle: TextStyle(
          color: Color(0xFF000000).withOpacity(.5),
    )),
    );
  }
}
