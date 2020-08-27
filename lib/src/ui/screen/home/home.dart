import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/ui/screen/category/category_page.dart';
import 'package:cartapp/utils/utils.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.only(left:16.0,top: 16,right:16 ),
        child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              _search(),
              SizedBox(
                height: 30,
              ),
              Text(
                "Categories",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(height: 100, child: buildListCategories()),
              SizedBox(
                height: 30,
              ),
              Row(
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
              SizedBox(
                height: 20,
              ),
              Container(
                  height: Utils().screenHeight(context, dividedBy: 2.4),
                  child: buildListLatest()),
              SizedBox(
                height: 20,
              ),
              buildContainerAds(context),
              SizedBox(
                height: 30,
              ),
              Text(
                "Featured Brands",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
              ),

              Container(
                  height: Utils().screenHeight(context, dividedBy: 6),
                  child: buildListFeaturedBrand())


            ],
          ),
        ),
      ),
    );
  }

  ListView buildListCategories() {
    return ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage()));
                  },
                  child: buildCategoryTile(context)),
              SizedBox(
                width: 30,
              ),
            ],
          );
        });
  }

  ListView buildListLatest() {
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
                  child: buildLatestTile(context)),
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
  Container buildCategoryTile(BuildContext context) {
    print(Utils().screenHeight(context, dividedBy: 13.5));
    return Container(
      width: Utils().screenWidth(context, dividedBy: 8),
      height: Utils().screenHeight(context, dividedBy: 8),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new CachedNetworkImageProvider(
                        "https://img.favpng.com/6/24/18/joystick-game-controller-video-game-icon-png-favpng-QPA1RVLFUEA3JuyVUAtkMctbC.jpg")),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.08),
                    blurRadius: 7,
                  ),
                ]),
            width: Utils().screenHeight(context, dividedBy: 13.5),
            height: Utils().screenHeight(context, dividedBy: 13.5),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Gaming",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
  Container buildLatestTile(BuildContext context) {
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
                    fit: BoxFit.cover,
                    image: new CachedNetworkImageProvider(
                        "https://images-na.ssl-images-amazon.com/images/I/61WixzlVuXL._UX342_.jpg")),
             ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Leather Wristwatch",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Text(
                      "Tag Heuer",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith( fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Text(
                      "\$450",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith( fontSize: 14,color: Color(0xFFFF7600),fontWeight: FontWeight.w400),
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
    );
  }
}
