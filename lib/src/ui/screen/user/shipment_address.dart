import 'package:flutter/material.dart';

class ShippingAddress extends StatefulWidget {
  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  int _index=0;
  int value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {Navigator.of(context).pop();},
          ),
          elevation: 0,
          title: Text(
            "Shipping Address",
            style: Theme.of(context).textTheme.headline5,
          ),
          centerTitle: true,
        ),
        body:SafeArea(child: Container(child:ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                value: index,
                groupValue: value,
                onChanged: (ind) => setState(() => value = ind),
                title: Text("Home Address",style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w500),),
                subtitle: Column(
                  children: <Widget>[
                    SizedBox(height: 4,),
                    Text("21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),

              ),
            );
          },
          itemCount: 3,
        ),)));
  }
  Widget _builderStep() => Container(
    margin: EdgeInsets.only(top: 10),
  child: Theme(
    data: ThemeData(
        primaryColor: Color(0xFFFF7600)
    ),
    child: Stepper(
      type: StepperType.horizontal,
        steps: [
          Step(
            title: Text(""),
            content: Column(children: <Widget>[

            ],),isActive: _index==0?true:false
          ),
          Step(
            title: Text(""),
            content: Text("This is our second example."),isActive: _index==1?true:false
          ),
          Step(
            title: Text(""),
            content: Text("This is our third example."),isActive: _index==2?true:false
          ),
        ],

      currentStep: _index,
      onStepTapped: (index) {
        setState(() {
          _index = index;
        });
      },
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
          Container(),
      ),
  ),
  );
}
