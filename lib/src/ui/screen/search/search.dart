
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/bloc/bloc_category.dart';
import 'package:cartapp/src/models/latest_item_list_response.dart';
import 'package:cartapp/utils/object_factory.dart';
import 'package:cartapp/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textEditingController = new TextEditingController();
  bool locationEnabled = false;
  TextEditingController locationController = TextEditingController();
  List<String> recentSearchedList = List<String>();
  List<String> trendingList = ["kochi","kaloor","Dog Friendly"];
  List<GlobalKey> globalKey = new List<GlobalKey>();
  BlocCategory blocCategory = new BlocCategory();
  ItemListResponse trending = new ItemListResponse();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (ObjectFactory().prefs.getRecentSearchList() != null) {
      recentSearchedList = ObjectFactory().prefs.getRecentSearchList();
    }
    blocCategory.getTrendingItemList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:28.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Center(
                    child: _search(),
                  ),
                ),
                recentSearchedList.length > 0
                    ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Recent Searches",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14,color: Colors.black38),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            ObjectFactory().prefs.saveRecentSearch(searchList: null);
                            recentSearchedList.clear();
                          });
                        },
                        child: Text(
                          "Clear all",
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.redAccent),
                        ),
                      )
                    ],
                  ),
                )
                    : SizedBox(),
                recentSearchedList.length > 0
                    ? Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      constraints:BoxConstraints(minHeight: 20, maxHeight: 200),
                      child: SingleChildScrollView(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: 12.0,
                          runSpacing: 16.0,
                          children: List<Widget>.generate(
                              ObjectFactory().prefs.getRecentSearchList().length,
                                  (int index) {
                                return GestureDetector(
                                  onTap: (){

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF0008),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.withOpacity(.32),
                                              width: .5),
                                          top: BorderSide(
                                              color: Colors.grey.withOpacity(.32),
                                              width: .5),
                                          left: BorderSide(
                                              color: Colors.grey.withOpacity(.32),
                                              width: .5),
                                          right: BorderSide(
                                              color: Colors.grey.withOpacity(.32),
                                              width: .5)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            recentSearchedList[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                )
                    : SizedBox(),
                SizedBox(height: 20,),
                Column(
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
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _search() => Container(
    width: Utils().screenWidth(context, dividedBy: 1.05),
    height: Utils().screenHeight(context, dividedBy: 19),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color(0xFFF0008),
      borderRadius: BorderRadius.all(Radius.circular(18)),
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 5, child: buildTextFormField(context)),
      ],
    ),
  );
  TextFormField buildTextFormField(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 2, left: 18),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(.01))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(.01))),
      ),
      onFieldSubmitted: (value){
        if (recentSearchedList.contains(textEditingController.text) == false) {
          recentSearchedList.insert(0, textEditingController.text);
        }
        textEditingController.clear();
        ObjectFactory()
            .prefs
            .saveRecentSearch(searchList: recentSearchedList);
      },
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

class ChipModel {
  String text;
  int index;
  bool isList;

  ChipModel({this.text, this.index, this.isList});
}


