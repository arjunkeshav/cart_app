import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<GlobalKey> globalKey = new List<GlobalKey>();

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 12; i++) {
      globalKey.add(GlobalKey());
    }
    return Scaffold(
//      key: _con.scaffoldKey,
//      bottomNavigationBar: CartBottomDetailsWidget(
//        con: _con,
//        from: '',
//      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {Navigator.of(context).pop();},
        ),
        elevation: 0,
        title: Text(
          "Order History",
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
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
                return Dismissible(
                  onDismissed: (value) {},
                  key: globalKey[index],
                  child: InkWell(
                    splashColor: Theme.of(context).accentColor,
                    focusColor: Theme.of(context).accentColor,
                    highlightColor: Theme.of(context).primaryColor,
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Sept 23, 2018",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 7),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Flexible(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "OD - 424923192 - N",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18),
                                          ),
                                          SizedBox(height: 8,),
                                          Text(
                                            "\$1100",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  color: Color(0xFFFF7600),
                                                ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          ButtonTheme(
                                            height: 35,
                                            minWidth: 90,
                                            child: FlatButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Delivered",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith(color: Colors.white),
                                              ),
                                              color: Color(0xFFFF7600),
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
                              ),
                              Container(
                                height: 110,
                                width: 110,
                                child: GridView.count(
                                  shrinkWrap: true,controller: ScrollController(keepScrollOffset: false),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                  children: List.generate(4, (index) {
                                    return index==3?Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Center(child: Text("+4",style: Theme.of(context).textTheme.headline5)),
                                      ),
                                    ): Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        child: CachedNetworkImage(
                                          height: 10,
                                          width: 10,
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              "https://c.static-nike.com/a/images/t_default/n55qeyd3egjlplxwfh1w/dri-fit-miler-mens-long-sleeve-running-top-zj96js.jpg",
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
