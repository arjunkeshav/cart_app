import 'package:cartapp/src/ui/screen/cart/summary.dart';
import 'package:cartapp/src/ui/screen/home/bottom_navigation.dart';
import 'package:cartapp/src/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';
  int _index=0;
  int value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,size: 20,),
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
          primaryColor: Color(0xFFFF7600),
          accentColor: Color(0xFFFF7600)
      ),
      child: Stepper(
        type: StepperType.horizontal,
        steps: [
          Step(
              title: Text("Delivery"),
              content: Column(mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: 1,
                    groupValue: value,
                    onChanged: (ind) => setState(() => value = ind),
                    title: Text("Standard Delivery",style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w500,fontSize: 20),),
                    subtitle: Column(
                      children: <Widget>[
                        SizedBox(height: 8,),
                        Text("Order will be delivered between 3 - 5 business days",style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),

                  ),
                  SizedBox(height: 22,),
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: value,
                    groupValue: value,
                    onChanged: (ind) => setState(() => value = ind),
                    title: Text("Next Day Delivery",style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w500),),
                    subtitle: Column(
                      children: <Widget>[
                        SizedBox(height: 8,),
                        Text("Place your order before 6pm and your items will be delivered the next day",style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),

                  ),
                  SizedBox(height: 22,),
                  RadioListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: value,
                    groupValue: value,dense: true, isThreeLine: true,
                    onChanged: (ind) => setState(() => value = ind),
                    title: Text("Nominated Delivery",style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w500),),
                    subtitle: Column(
                      children: <Widget>[
                        SizedBox(height: 8,),
                        Text("Pick a particular date from the calendar and order will be delivered on selected date",style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),

                  )

                ],
              ),isActive: _index==0?true:false,state:_index==0?StepState.editing: StepState.complete,
          ),
          Step(
              title: Text("Address"),
              content: _buildAddress(),isActive: _index==1?true:false,state:_index==1?StepState.editing:_index>1?StepState.complete:StepState.indexed
          ),
          Step(
              title: Text("Payments"),
              content: Text("This is our third example."),isActive: _index==2?true:false,state:_index==2?StepState.editing:_index>2?StepState.complete:StepState.indexed
          ),
        ],

        currentStep: _index,
        // onStepTapped: (index) {
        //   setState(() {
        //     _index = index;
        //   });
        // },
        onStepContinue:(){
          if(_index<2) {
            setState(() {
              _index = _index + 1;
            });
          }
          else
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                Summary()));
          }
        } ,
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
            Container(child:    Column(
              children: [
                SizedBox(height: 40,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,mainAxisSize: MainAxisSize.max,
                  children: [
                    ButtonTheme(
                      height: 40,
                      minWidth: 100,
                      child: FlatButton(
                        onPressed: onStepContinue,
                        child: Text(
                          "Next",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                        color: Color(0xFFFF7600),
                      ),
                    ),
                  ],
                ),
              ],
            ),),
      ),
    ),
  );
  Widget _buildAddress() => new Column(
    children: <Widget>[
      RadioListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: value,
        groupValue: value,
        onChanged: (ind) => setState(() => value = ind),
        subtitle: Column(
          children: <Widget>[
            SizedBox(height: 8,),
            Text("Billing address is the same as delivery address",style: Theme.of(context).textTheme.bodyText1,),
          ],
        ),

      ),
      
      SizedBox(height: 30,),
      new TextFormField(
        decoration: const InputDecoration(
          labelText: 'Street1',
          labelStyle: TextStyle(height: -1)
        ),
      ),
      SizedBox(height: 30,),
      new TextFormField(
        decoration: const InputDecoration(

          labelStyle: TextStyle(height: -1),
          labelText: 'Street2',
        ),

      ),
      SizedBox(height: 30,),
      new TextFormField(
        decoration: const InputDecoration(

          labelStyle: TextStyle(height: -1),
          labelText: 'City',
        ),
      ),
      SizedBox(height: 30,),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: new TextFormField(
              decoration: const InputDecoration(

                labelStyle: TextStyle(height: -1),
                labelText: 'State',
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: new TextFormField(
              decoration: const InputDecoration(

                labelStyle: TextStyle(height: -1),
                labelText: 'Country',
              ),
            ),
          ),

        ],
      ),


    ],
  );
}
