import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/bloc/bloc_category.dart';
import 'package:cartapp/src/models/category_response.dart';
import 'package:cartapp/src/models/latest_item_list_response.dart';
import 'package:cartapp/src/ui/screen/category/category_page.dart';
import 'package:cartapp/src/ui/screen/search/search.dart';
import 'package:cartapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin<Explore> {
  TextEditingController textEditingController = new TextEditingController();
  BlocCategory blocCategory = new BlocCategory();

ItemListResponse latest = new ItemListResponse();
ItemListResponse trending = new ItemListResponse();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    blocCategory.getAllCategory();
    blocCategory.getLatestItemList();
    blocCategory.getTrendingItemList();
    super.initState();
  }


  @override
  void dispose() {
    blocCategory?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Padding(
          padding: const EdgeInsets.only(left:16.0,top: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: _search(),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Categories",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<List<CategoryResponse>>(
                  stream: blocCategory.viewAllCategoryResponse,
                  builder: (context, snapshot) {
                    return Container(height: 110, child:snapshot.hasData? buildListCategories(snapshot.data):Center(child: CircularProgressIndicator(),));
                  }
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Latest",
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
                  stream: blocCategory.viewLatestItemListResponse,
                  builder: (context, snapshot) {
                    return Container(
                        height: Utils().screenHeight(context, dividedBy: 2.4),
                        child: snapshot.hasData? buildItemList(snapshot.data):Center(child: CircularProgressIndicator(),));
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                buildContainerAds(context),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Featured Brands",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  ],
                ),

                Container(
                    height: Utils().screenHeight(context, dividedBy: 6),
                    child: buildListFeaturedBrand()),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
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
                SizedBox(
                  height: 20,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildListCategories(List<CategoryResponse> categoryResponse) {
    return ListView.builder(
        itemCount: categoryResponse.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoryPage()));
              },
              child: buildCategoryTile(context,categoryResponse[index]));
        });
  }

  ListView buildItemList(ItemListResponse itemListResponse) {
    return ListView.builder(
        itemCount: itemListResponse.products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
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
  ListView buildListFeaturedBrand() {
    return ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) =>
//                                SearchFlatViewDetails(flat: flatList[index])));
                  },
                  child: buildFeaturedBrandTile(context)),
              SizedBox(
                width: 16,
              ),
            ],
          );
        });
  }
  Column buildCategoryTile(BuildContext context, CategoryResponse categoryResponse) {
    print(Utils().screenHeight(context, dividedBy: 9.5));
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: new DecorationImage(
                  fit: BoxFit.contain,
                  image: new CachedNetworkImageProvider(
                      categoryResponse.iconPath !=null ?categoryResponse.iconPath:"https://img.favpng.com/6/24/18/joystick-game-controller-video-game-icon-png-favpng-QPA1RVLFUEA3JuyVUAtkMctbC.jpg")),
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.black12.withOpacity(0.08),
//                    blurRadius: 5,
//                  ),
//                ]
          ),
          width: 95,
          height: 95,
        ),
        Container(
          child: Text(
            categoryResponse.categoryName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
            ),
          ),
        )
      ],
    );
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
  Container buildFeaturedBrandTile(BuildContext context) {
    return Container(
      width: Utils().screenWidth(context, dividedBy: 2.3),
      height: Utils().screenHeight(context, dividedBy: 13.5),

      child: Row(
        children: <Widget>[
          Container(

            height: Utils().screenHeight(context, dividedBy: 13.5),
            width: Utils().screenHeight(context, dividedBy: 13.5),
            decoration: BoxDecoration(
                shape: BoxShape.circle,

                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new CachedNetworkImageProvider(
                        "https://avatars3.githubusercontent.com/u/10521324?s=200&v=4")),
             ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0,top: 8),
            child: Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "B&o",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:6.0),
                    child: Text(
                      "5693 Products",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith( fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Container buildContainerAds(BuildContext context) {
    return Container(
      height: Utils().screenHeight(context, dividedBy: 4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,

        image: new DecorationImage(
            fit: BoxFit.cover,
            image: new CachedNetworkImageProvider(
                "https://cdn.mos.cms.futurecdn.net/mjiSX83jPoDTrqLaAASMWL.jpg")),
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
                      onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Search()));
                      },
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
    );
  }
}
