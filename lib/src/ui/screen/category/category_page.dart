import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartapp/src/ui/screen/category/item_details_page.dart';
import 'package:cartapp/utils/utils.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("No filters applied",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            ButtonTheme(
              height: 50,
              minWidth: 140,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "FILTER",
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
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios,size: 18,),onPressed: (){
        Navigator.of(context).pop();
      },),
        elevation: 0,centerTitle: true,
        title: Text(
          "Gadgets",
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).accentColor,),

              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),

              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:16.0),
        child: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Text(
                  "Top Brands",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 2),
                  height: Utils().screenHeight(context, dividedBy: 7),
                  child: buildListTopBrand()),
              Expanded(
                child: buildListItems(),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView buildListTopBrand() {
    return ListView.builder(
        padding: EdgeInsets.only(left: 2),
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
                  child: buildTopBrandTile(context)),
              SizedBox(
                width: 16,
              ),
            ],
          );
        });
  }

  Container buildTopBrandTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(    boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.073),
          blurRadius: 2,
        ),
      ],color: Colors.white),
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
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "B&o",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      "5693 Products",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 12),
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

  GridView buildListItems() {
    return GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,childAspectRatio: Utils().screenWidth(context, dividedBy: 2.3)/Utils().screenHeight(context, dividedBy: 2.4),
        // Generate 100 widgets that display their index in the List.
        children: List.generate(12, (index) {
          return GestureDetector(
              onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            ItemDetails()));
              },
              child: buildItemTile(context));
        }));
  }

  Container buildItemTile(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Leather Wristwatch",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "Tag Heuer",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "\$450",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 14,
                          color: Color(0xFFFF7600),
                          fontWeight: FontWeight.w400),
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
}
