import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/ui/screen/order/order_history.dart';
import 'package:cartapp/src/ui/screen/user/wishlist.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//      appBar: AppBar(
//        automaticallyImplyLeading: true,
//        title: Text(
//          "Flatmate Central" + "\u2122",
//          style: Theme.of(context).textTheme.subhead.copyWith(
//            fontWeight: FontWeight.w600,
//            color: Color(0xFF666B77),
//          ),
//        ),
//        elevation: 0,
//      ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            GestureDetector(
//            onTap: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => MyProfile())),
              child: Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                   Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new CachedNetworkImageProvider(
                                "https://www.nicesnippets.com/demo/profile-1.jpg")),
                      ),
                      width: 100,
                      height: 100,
                    ),
//                      : Container(
//                    decoration: BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Theme.of(context).iconTheme.color,
//                    ),
//                    child: Center(
//                      child: ImageIcon(
//                        AssetImage("assets/icons/user.png"),
//                        color: Colors.white,
//                        size: 34,
//                      ),
//                    ),
//                    width: 60,
//                    height: 60,
//                  ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "David Spade",
                            style: Theme.of(context).textTheme.headline1.copyWith(fontWeight: FontWeight.w600)
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          child: Text(
                            "iamdavid@gmail.com",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            SizedBox(height: 10,),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                SettingsTile('Edit Profile', null, false),
                SizedBox(height: 10,),
                SettingsTile('Shipping Address', null, false),
                SizedBox(height: 10,),
                SettingsTile('Wishlist', null, false),
                SizedBox(height: 10,),
                SettingsTile('Order History', null, false),
                SizedBox(height: 10,),
                SettingsTile('Track Order', null, false),
                SizedBox(height: 10,),
                SettingsTile('Cards', null, false),
                SizedBox(height: 10,),
                SettingsTile('Notifications', null, false),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: ListTile(
                    onTap: () {
//                    logout(context);
                    },
                    leading: Icon(Icons.exit_to_app),
                    title: Text(
                      "Logout",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),

//                Container(
//                  margin: EdgeInsets.symmetric(horizontal: 15),
//                  child: ListTile(
//                    onTap: () {
////                    Navigator.push(
////                        context,
////                        new MaterialPageRoute(
////                            builder: (BuildContext context) =>
////                                FlatmateRequests()));
//                    },
//                    leading: Icon(Icons.explore),
//                    title: Text(
//                      "My requests",
//                      style: Theme.of(context).textTheme.body1,
//                    ),
//                  ),
//                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
class SettingsTile extends StatelessWidget {
  SettingsTile(this.text, this.icon, this.showTrailer, [this.count]);

  final String text;
  final String icon;
  final bool showTrailer;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        onTap: () {
          if(text=="Wishlist") {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                WishList()));
          }
          else if(text=="Order History") {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                OrderHistoryPage()));
          }
//          showToast("coming soon");
        },
        leading: icon == null
            ? Icon(Icons.exit_to_app)
            : ImageIcon(
          AssetImage(icon),
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
        trailing: showTrailer
            ? Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color: Color(0xFF72C2A6),
            ),
            child: Center(
              child: Text(
                count,
                style: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ))
            : SizedBox(),
      ),
    );
  }
}
