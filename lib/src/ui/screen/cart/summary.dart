import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/models/latest_item_list_response.dart';
import 'package:cartapp/utils/utils.dart';
import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  int value =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
          children: [
            ButtonTheme(
              height: 40,
              minWidth: 120,
              child: OutlineButton(
                onPressed: (){},
                child: Text(
                  "Cancel",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.black),
                ),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(2.0)),borderSide: BorderSide(color: Color(0xFFFF7600),),

              ),
            ),
            SizedBox(width:15),
            ButtonTheme(
              height: 40,
              minWidth: 120,
              child: FlatButton(
                onPressed: (){},
                child: Text(
                  "Pay",
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
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        title: Text(
          "Summary",
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded
          (
          flex: 3,
            child: buildItemList()),
        Expanded(
          flex: 1,
            child: Divider()),
        Expanded(
          flex: 7,
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: value,
              groupValue: 0,toggleable:true,
              onChanged: (ind) => setState(() => value = ind),
              title: Text("Home Address",style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w500),),
              subtitle: Column(
                children: <Widget>[
                  SizedBox(height: 4,),
                  Text("21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",style: Theme.of(context).textTheme.bodyText1,),
                ],
              ),

            )),
      ],),
    );
  }
  ListView buildItemList() {
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             ItemDetails()));
                  },
                  child: buildLatestTile(context),)

            ],
          );
        });
  }
  Container buildLatestTile(BuildContext context) {
    return Container(
      width: Utils().screenWidth(context, dividedBy: 3),
      height: Utils().screenHeight(context, dividedBy: 5),

      child: Column(
        children: <Widget>[
          Container(
            height: Utils().screenHeight(context, dividedBy: 9),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,

              image: new DecorationImage(
                  fit: BoxFit.contain,
                  image: new CachedNetworkImageProvider(
                      "https://www.officespacesny.com/wp-content/themes/realestate-7/images/no-image.png")),
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Container(
              height: Utils().screenHeight(context, dividedBy: 15),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "Product",maxLines: 2,overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),

                  Text("\u20B91200",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith( fontSize: 14,color: Color(0xFFFF7600),fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
