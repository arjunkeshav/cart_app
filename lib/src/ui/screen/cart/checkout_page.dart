import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

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
            "Checkout",
            style: Theme.of(context).textTheme.headline5,
          ),
          centerTitle: true,
        ),
        body:SafeArea(child: Container(child:_builderStep(),)));
  }
  Widget _builderStep() => Container(
    margin: EdgeInsets.only(top: 10),
    child: Theme(
      data: ThemeData(
          primaryColor: Color(0xFFFF7600)
      ),
      child: Stepper(
        type: StepperType.horizontal,physics: ScrollPhysics(),
        steps: [
          Step(
              title: Text("Delivery"),
              content: Column(mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: 1,
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
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: value,
                    groupValue: value,
                    onChanged: (ind) => setState(() => value = ind),
                    title: Text("Home Address",style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w500),),
                    subtitle: Column(
                      children: <Widget>[
                        SizedBox(height: 4,),
                        Text("21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),

                  )
                ],
              ),isActive: _index==0?true:false,state:_index==0?StepState.editing: StepState.complete,
          ),
          Step(
              title: Text(""),
              content: Text("This is our second example."),isActive: _index==1?true:false
          ),
          Step(
              title: Text(""),
              content: Text("This is our third example."),isActive: _index==2?true:false,
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
