import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/ui/screen/cart/checkout_page.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<GlobalKey> globalKey = new List<GlobalKey>();
  @override
  Widget build(BuildContext context) {
    for(int i=0;i<12;i++){
      globalKey.add(GlobalKey());
    }
    return SafeArea(
      child: Scaffold(
//      key: _con.scaffoldKey,
//      bottomNavigationBar: CartBottomDetailsWidget(
//        con: _con,
//        from: '',
//      ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Theme.of(context).focusColor.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 2)),
                        ],
          ),
          width: MediaQuery.of(context).size.width,
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("TOTAL",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                  Text("\$1500",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Color(0xFFFF7600),
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              ButtonTheme(
                height: 40,
                minWidth: 140,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        CheckoutPage()));

                  },
                  child: Text(
                    "CHECKOUT",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                  color: Color(0xFFFF7600),
                ),
              )
            ],
          ),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10),
            children: <Widget>[
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: 12,
//              separatorBuilder: (context, index) {
//                return SizedBox(height: 15);
//              },
                itemBuilder: (context, index) {
                  return Dismissible(onDismissed: (value){},key: globalKey[index],
                    child: InkWell(
                      splashColor: Theme.of(context).accentColor,
                      focusColor: Theme.of(context).accentColor,
                      highlightColor: Theme.of(context).primaryColor,
                      onTap: () {},
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                            decoration: BoxDecoration(
                              color: Colors.white,
//                      boxShadow: [
//                        BoxShadow(
//                            color:
//                                Theme.of(context).focusColor.withOpacity(0.1),
//                            blurRadius: 5,
//                            offset: Offset(0, 2)),
//                      ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  child: CachedNetworkImage(
                                    height: 110,
                                    width: 110,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        "https://c.static-nike.com/a/images/t_default/n55qeyd3egjlplxwfh1w/dri-fit-miler-mens-long-sleeve-running-top-zj96js.jpg",
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Nike dri-fit long sleeve",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  .copyWith(fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "\$1100",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style:
                                                  Theme.of(context).textTheme.subtitle1.copyWith(color: Color(0xFFFF7600),),
                                            ),
                                            SizedBox(height: 15,),
                                            Container(height: 35,
                                              color: Color(0xFF0000F),
                                              child: Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
//                                      widget.increment();
                                                      });
                                                    },
                                                    iconSize: 22,

                                                    icon: Icon(Icons.add),
                                                    color: Theme.of(context).hintColor,
                                                  ),
                                                  Align(alignment:Alignment.center,
                                                    child: Text("2",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            .copyWith(fontSize: 18)),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
//                                      widget.decrement();
                                                      });
                                                    },
                                                    iconSize: 22,

                                                    icon: Icon(Icons.remove),
                                                    color: Theme.of(context).hintColor,
                                                  ),
                                                ],
                                              ),
                                            ),

//                                  Wrap(
//                                    children: List.generate(4,
//                                            (index) {
//                                          return Text(
//                                            widget.cart.extras.elementAt(index).name + ', ',
//                                            style: Theme.of(context).textTheme.caption,
//                                          );
//                                        }),
//                                  ),
//                                  Helper.getPrice(widget.cart.food.price, context,
//                                      style: Theme.of(context).textTheme.headline4)
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
