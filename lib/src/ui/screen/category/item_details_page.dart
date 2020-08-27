import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemDetails extends StatefulWidget {
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  BorderRadiusTween borderRadius;
  Duration _duration = Duration(milliseconds: 500);
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  double min = 0.1, initial = 0.3, max = .98;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController controller = new ScrollController();
  TextEditingController searchController = new TextEditingController();

  bool loading = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _duration);
    if (_controller.isDismissed)
      _controller.forward();
    else if (_controller.isCompleted) _controller.reverse();
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(10.0),
      end: BorderRadius.circular(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("PRICE",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                Text("\$1500",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(
                        color: Color(0xFFFF7600),
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            ButtonTheme(
              height: 40,
              minWidth: 140,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "ADD",
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
      body: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new CachedNetworkImageProvider(
                              "https://c.static-nike.com/a/images/t_default/n55qeyd3egjlplxwfh1w/dri-fit-miler-mens-long-sleeve-running-top-zj96js.jpg")),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .5,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .5,
                      decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                          colors: [
                            Colors.black.withOpacity(.50),
                            Colors.black.withOpacity(.50),
                            Colors.black.withOpacity(.34),
                            Colors.black.withOpacity(.23),
                            Colors.black.withOpacity(.14),
                            Colors.black.withOpacity(.05),
                            Colors.black.withOpacity(.00),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 12, right: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),

                        Icon(
                          Icons.star_border,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
            ),
            SizedBox.expand(
              child: SlideTransition(
                position: _tween.animate(_controller),
                child: DraggableScrollableSheet(
                  minChildSize: .6,
                  // 0.1 times of available height, sheet can't go below this on dragging
                  maxChildSize: .99,
                  // 0.7 times of available height, sheet can't go above this on dragging
                  initialChildSize: .6,
                  // 0.1 times of available height, sheet start at this size when opened for first time
                  builder: (BuildContext context, ScrollController controller) {
//                    if (controller.hasClients) {
//                      var dimension = controller.position.viewportDimension;
//                      _height ??= dimension / initial;
//                      if (dimension >= _height * max * 0.9)
//                        _onWidgetDidBuild(() {
//                          _scaffoldKey.currentState.showSnackBar(SnackBar(
//                            content: Text('ON TOP'),
//                            duration: Duration(seconds: 3),
//                          ));
//                        });
//                      else if (dimension <= _height * min * 1.1)
//                        _onWidgetDidBuild(() {
//                          _scaffoldKey.currentState.showSnackBar(SnackBar(
//                            content: Text('ON BOTTOM'),
//                            duration: Duration(seconds: 3),
//                          ));
//                        });
//                    }
                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0)),
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: SingleChildScrollView(
                              controller: controller,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Nike Dri-FIT Long Sleeve",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .43,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .05,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .withOpacity(.24)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(22))),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text(
                                                  "Size",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                ),
                                                Text(
                                                  "XL",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .copyWith(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.black),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .43,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .05,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .withOpacity(.24)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(22))),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text(
                                                  "Color",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF31407B),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4))),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .03,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .03,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Details",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                height: 2),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Reviews",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Write your review",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFFFF7600)),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Wrap(
                                        children: List<Widget>.generate(
                                            8,
                                                (int index) {

                                              return Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: buildReviewsTiles(context),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildReviewsTiles(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) =>
//                      SearchFlatViewDetails(flat:flat)));

        },
        child: Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new CachedNetworkImageProvider(
                              "https://pixinvent.com/materialize-material-design-admin-template/app-assets/images/user/12.jpg")),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.08),
                          blurRadius: 0,
                        ),
                      ]),
                  width: MediaQuery.of(context).size.height*.08,
                  height: MediaQuery.of(context).size.height*.08,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Samuel Smith"
                        ,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Wonderful jean, perfect gift for my girl!",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
//                        Text(" +5 more",style: Theme.of(context).textTheme.body2.copyWith(fontSize: 11,fontWeight: FontWeight.w100))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: RatingBarIndicator(
                rating: 4,
                itemBuilder: (context, index) => Icon(
                   Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 14.0,
                unratedColor: Colors.amber.withAlpha(50),
                direction: Axis.horizontal,
              ),

            ),
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height*.1,width: MediaQuery.of(context).size.width,
    );

  }

//  _onWidgetDidBuild(Function callback) {
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      callback();
//    });
//  }

//  launchURL() async {
//    String homeLat = flat.lat;
//    String homeLng = flat.lon;
//    final String googleMapsLocationUrl =
//        "https://www.google.com/maps/search/?api=1&query=$homeLat,$homeLng";
//
//    final String encodedURl = Uri.encodeFull(googleMapsLocationUrl);
//
//    if (await canLaunch(encodedURl)) {
//      await launch(encodedURl);
//    } else {
//      print('Could not launch $encodedURl');
//      throw 'Could not launch $encodedURl';
//    }
//  }


//  Future<bool> onWillPop() {
////    Navigator.of(context).pop();
//    Navigator.pushAndRemoveUntil(
//        context,
//        MaterialPageRoute(builder: (context) => HomeFlatmate()),
//            (Route<dynamic> route) => false);
//    return null;
//  }
}
