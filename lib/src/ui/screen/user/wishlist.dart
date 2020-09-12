import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/bloc/bloc_category.dart';
import 'package:cartapp/src/models/latest_item_list_response.dart';
import 'package:cartapp/utils/utils.dart';
import 'package:flutter/material.dart';


class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  List<GlobalKey> globalKey = new List<GlobalKey>();
  BlocCategory blocCategory = new BlocCategory();

  ItemListResponse trending = new ItemListResponse();

  @override
  void initState() {
    blocCategory.getLatestItemList();
    blocCategory.getTrendingItemList();
    super.initState();
  }
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
          "Wishlist",
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 15),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: 4,
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
                child: index==3?Column(
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right:16.0,left: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Trending",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                        Text(
                          "See all",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<ItemListResponse>(
                      stream: blocCategory.viewTrendingItemListResponse,
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          trending =  snapshot.data;

                        }
                        return Container(
                            height: Utils().screenHeight(context, dividedBy: 2.4),
                            child: snapshot.hasData? buildItemList(snapshot.data):Center(child: CircularProgressIndicator(),));
                      }
                  ),
                ],):Column(
                  children: <Widget>[
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
                          ),SizedBox(width: 15,),
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
                                        "Smart Backpack",
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

                        ],
                      ),
                    ),
                   index==2?SizedBox(
                      height: 20,
                    ):SizedBox(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ListView buildItemList(ItemListResponse itemListResponse) {
    return ListView.builder(
        itemCount: itemListResponse.products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              index==0?SizedBox(
                width: 16,
              ):SizedBox(),
              GestureDetector(
                  onTap: () {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) =>
//                                SearchFlatViewDetails(flat: flatList[index])));
                  },
                  child: buildLatestTile(context,itemListResponse.products[index])),
              SizedBox(
                width: 16,
              ),
            ],
          );
        });
  }
  Container buildLatestTile(BuildContext context, Product product) {
    return Container(
      width: Utils().screenWidth(context, dividedBy: 2.3),
      height: Utils().screenHeight(context, dividedBy: 2.4),

      child: Column(
        children: <Widget>[
          Container(
            height: Utils().screenHeight(context, dividedBy: 3.4),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,

              image: new DecorationImage(
                  fit: BoxFit.contain,
                  image: new CachedNetworkImageProvider(
                      product.mainPair==null?"https://www.officespacesny.com/wp-content/themes/realestate-7/images/no-image.png":product.mainPair.detailed.imagePath)),
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Container(
              height: Utils().screenHeight(context, dividedBy: 9.5),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    product.product,maxLines: 2,overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    "Tag Heuer",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith( fontSize: 12),
                  ),
                  Text("\u20B9${double.tryParse(product.price).round()}",
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
