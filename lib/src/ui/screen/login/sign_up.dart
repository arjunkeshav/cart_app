
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController textEditingControllerName = new TextEditingController();
  TextEditingController textEditingControllerEmail = new TextEditingController();
  TextEditingController textEditingControllerPhone = new TextEditingController();
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
              Colors.white,
              Color(0xFFDDDDDD)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:2.0,top: 40,right: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                },icon: Icon(Icons.arrow_back_ios,color: Colors.black.withOpacity(.65),),)],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 40, right: 12),
              child: Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                color: Color(0xFFFFFFFF),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                    height: 20,
                  ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Sign Up",
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5.copyWith(fontWeight: FontWeight.w700,fontSize: 28),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    buildTextField(
                        context: context,
                        obscureText: false,
                        textEditingController: textEditingControllerName,
                        labelText: "Name",textInputType: TextInputType.text),
                    SizedBox(
                      height: 30,
                    ),
                    buildTextField(
                        context: context,
                        obscureText: false,
                        textEditingController: textEditingControllerEmail,
                        labelText: "Email",textInputType: TextInputType.text),
                    SizedBox(
                      height: 30,
                    ),
                    buildTextField(
                        context: context,
                        obscureText: false,
                        textEditingController: textEditingControllerPhone,
                        labelText: "Phone",textInputType: TextInputType.phone),
                    SizedBox(
                      height: 30,
                    ),
                    buildTextField(
                        context: context,
                        obscureText: true,
                        textEditingController: textEditingControllerPsd,
                        labelText: "Password",textInputType: TextInputType.text),

                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 12),
                      child: ButtonTheme(
                        height: 40,
                        minWidth: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "SIGN UP",
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


          ],
        ),
      ),
    );;
  }
  TextField buildTextField({BuildContext context,
    bool obscureText,
    TextEditingController textEditingController,
    String labelText,TextInputType textInputType}) {
    return TextField(
      obscureText: obscureText,
      keyboardType: textInputType,
      controller: textEditingController,
      onChanged: (_) {},
      style: Theme
          .of(context)
          .textTheme
          .bodyText1
          .copyWith(fontWeight: FontWeight.w500,fontSize: 18),
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
