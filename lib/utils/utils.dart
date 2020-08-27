//import 'dart:io';
//
//import 'package:dio/dio.dart';
//import 'package:flatmate_central/src/ui/widget/multiple_drop_down.dart';
//import 'package:flatmate_central/src_revamp/utils/constants.dart';
//import 'package:flatmate_central/src/utils/constants/colors.dart';
//import 'package:flatmate_central/src_revamp/blocs/feedback_bloc.dart';
//import 'package:flatmate_central/src_revamp/models/flat/age_group_response.dart';
//import 'package:flatmate_central/src_revamp/models/flat/master_data.dart';
//import 'package:flatmate_central/src_revamp/ui/screen/home/home.dart';
//import 'package:flatmate_central/src_revamp/utils/object_factory.dart';
//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:intl/intl.dart';
//import 'package:path_provider/path_provider.dart';
//
//
import 'package:flutter/material.dart';

/////it contain common functions
class Utils {

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }
}
//  static final dateTimeFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
//
//
//  static String getDateTimeForAPI(DateTime dateTime) {
//    if (dateTime != null) {
//      dateTime = dateTime.toUtc();
//      return dateTimeFormat.format(dateTime).toString();
//    } else {
//      return "";
//    }
//  }
//
//  static String capitalize(String s) {
//    if (s != null && s.isNotEmpty) {
//      return s[0].toUpperCase() + s.substring(1);
//    } else {
//      return "";
//    }
//  }
//
//  static bool checkLoggedIn() {
//    if (ObjectFactory().prefs.isLoggedIn()) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//
//  static String toMonth(int val) {
//    switch (val) {
//      case 1:
//        {
//          return "Jan";
//        }
//        break;
//      case 2:
//        {
//          return "Feb";
//        }
//        break;
//      case 3:
//        {
//          return "Mar";
//        }
//        break;
//      case 4:
//        {
//          return "Apr";
//        }
//        break;
//      case 5:
//        {
//          return "May";
//        }
//        break;
//      case 6:
//        {
//          return "Jun";
//        }
//        break;
//      case 7:
//        {
//          return "Jul";
//        }
//        break;
//      case 8:
//        {
//          return "Aug";
//        }
//        break;
//      case 9:
//        {
//          return "Sep";
//        }
//        break;
//      case 10:
//        {
//          return "Oct";
//        }
//        break;
//      case 11:
//        {
//          return "Nov";
//        }
//        break;
//      default:
//        {
//          return "Dec";
//        }
//    }
//  }
//
//  static String formatTime(int val) {
//    if (val > 12) {
//      return ("PM");
//    } else
//      return ("AM");
//  }
//
//  static String formatHour(int val) {
//    if (val < 13) {
//      return (val.toString());
//    } else
//      return (val - 12).toString();
//  }
//
//  static void logoutAction(context) {
//    showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(8.0)),
//            content: Text(
//              Constants.LOGIN_CONFIRMATION_TEXT,
//              style: Theme.of(context).textTheme.title.copyWith(
//                  fontSize: 16.0, color: AppColors.materialBlackColor),
//            ),
//            actions: <Widget>[
//              FlatButton(
//                  child: Text(
//                    Constants.CANCEL,
//                    style: Theme.of(context)
//                        .textTheme
//                        .title
//                        .copyWith(color: Theme.of(context).primaryColor),
//                  ),
//                  onPressed: () {
//                    Navigator.pop(context);
//                  }),
//              FlatButton(
//                  child: Text(
//                    Constants.LOGOUT_TEXT,
//                    style: Theme.of(context)
//                        .textTheme
//                        .title
//                        .copyWith(color: Theme.of(context).primaryColor),
//                  ),
//                  onPressed: () async {
//                    /// clearing prefs  and   navigate to login page
//                    MasterDataResponse masterDataResponse ;
//                    masterDataResponse = ObjectFactory().prefs.getMasterData();
//                    ObjectFactory().prefs.setIsLoggedIn(false);
//                    ObjectFactory().prefs.setIsUserLoaded(false);
//                    ObjectFactory().prefs.setFlatAdded(false);
//                    ObjectFactory().prefs.setIsUserLoaded(false);
//                    ObjectFactory().prefs.setIsFlatRequested(false);
////                    ObjectFactory().prefs.clearPrefs();
////                    ObjectFactory().prefs.saveMasterData(masterDataResponse);
//                    Navigator.pushAndRemoveUntil(
//                        context,
//                        MaterialPageRoute(builder: (context) => Home()),
//                        (Route<dynamic> route) => false);
//
////                    Navigator.pushAndRemoveUntil(
////                        context,
////                        MaterialPageRoute(builder: (context) => Login()),
////                            (Route<dynamic> route) => false);
//                  }),
//            ],
//          );
//        });
//  }
//  static void feedbackModalBottomSheet(context,{String screen}) {
//TextEditingController textEditingController = new TextEditingController();
//TextEditingController textEditingControllerDesc = new TextEditingController();
//    showModalBottomSheet(
//        context: context,
//        backgroundColor: Colors.white,
//        elevation: 4,
//        isScrollControlled: true,
//        isDismissible: false,
//        builder: (BuildContext bc) {
//          return StatefulBuilder(
//            builder: (BuildContext context, setState) {
//
//              return Padding(
//                padding: EdgeInsets.only(
//                    bottom: MediaQuery.of(context).viewInsets.bottom),
//                child: Container(
//                  height: 400,
//                  child: Stack(
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.only(top:30.0),
//                        child: ListView(
//                          children: <Widget>[
//                            SizedBox(height: 20,),
//
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: TextField(
//                                style: TextStyle(color: AppColors.itemsFontColor.withOpacity(.86),fontSize: 16),
//                                onTap: (){},
//                                obscureText: false,
//                                controller: textEditingController,
//                                cursorColor: AppColors.primaryColor,
//                                onSubmitted: (value){FocusScope.of(context).requestFocus(FocusNode());},
//                                decoration: InputDecoration(
//                                  labelText:"Title",
//                                  hintText: "eg. font size ",
//                                  enabledBorder: OutlineInputBorder(
//                                      borderSide: const BorderSide(color: AppColors.primaryColor),
//                                      borderRadius: BorderRadius.circular(6)),
//                                  labelStyle: TextStyle(
//                                    color: AppColors.forgotPassFontColor.withOpacity(.56),height: 1,
//                                  ),
//                                  border: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.primaryColor),),
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: TextField(
//                                controller: textEditingControllerDesc,
//                                style: TextStyle(color: AppColors.itemsFontColor.withOpacity(.86),fontSize: 16),
//                                keyboardType: TextInputType.multiline,
//                                cursorWidth: 2,
//                                maxLines: 10,
//                                obscureText: false,
//                                onSubmitted: (value){FocusScope.of(context).requestFocus(FocusNode());},
//                                cursorColor: AppColors.primaryColor,
//                                decoration: InputDecoration(
//                                  hintText: "eg. Increase button font size.",
//                                  labelText: "Description",
//                    hintStyle: TextStyle(color: AppColors.itemsFontColor.withOpacity(.56),fontSize: 16),
//
//                    enabledBorder: OutlineInputBorder(
//                        borderSide: const BorderSide(color: AppColors.primaryColor),
//                        borderRadius: BorderRadius.circular(9)),
//                                  labelStyle: TextStyle(
//                                    color: AppColors.forgotPassFontColor
//                                        .withOpacity(.56),
//                                    height: 1,
//                                  ),
//                                  border: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.primaryColor),),
//                                ),
//                              ),
//                            )
//
//
//
//                          ],
//                        ),
//                      ),
//                      Positioned(top: 0,
//                          right: 0,
//                          child: Container(
//                            width: MediaQuery.of(context).size.width,
//                            height: 40,
//                            child: Padding(
//                              padding: const EdgeInsets.symmetric(horizontal: 12),
//                              child: Row(
//                                mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
//                                Text("Feedback",style: Theme.of(context).textTheme.headline.copyWith(color: AppColors.primaryColor),),
//                                FlatButton(
//                                  onPressed: () {
//                                    Navigator.of(context).pop();
//                                  },
//                                  child: Text(
//                                    "Close",
//                                    style: TextStyle(
//                                      fontSize: 14,
//                                      color: AppColors.primaryColor,
//                                    ),
//                                  ),
//                                )
//                              ],),
//                            ),
//                            color: Colors.white,)),
//                      Positioned(
//                        bottom: 0,
//                        right: 0,
//                        left: 0,
//                        child: Container(
//                          decoration: BoxDecoration(color: Colors.white,
//                              borderRadius: BorderRadius.circular(44)),
//                          width: MediaQuery.of(context).size.width,
//                          height: 50,
//
//                          child: FlatButton(
//                            onPressed: () {
//                              if(textEditingController.text !="" && textEditingControllerDesc.text !="") {
//                                feedbackBloc.addFeedback(
//                                    phoneModel: ObjectFactory().prefs
//                                        .getPhoneModel(),
//                                    feedbackDesc: textEditingControllerDesc
//                                        .text,
//                                    feedbackTitle: textEditingController.text,
//                                    screenName: screen);
//                                showToast("Sending...");
//                                Navigator.of(context).pop();
//                              }else{
//                                showToast("Please enter all the fields.");
//                              }
//                            },
//                            child: Text(
//                              "Submit",
//                              style: TextStyle(color: AppColors.whiteColor),
//                            ),
//                            color: AppColors.primaryColor,
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              );
//            },
//          );
//        });
//  }
//}
//
//Size screenSize(BuildContext context) {
//  return MediaQuery.of(context).size;
//}
//
//double screenHeight(BuildContext context, {double dividedBy = 1}) {
//  return screenSize(context).height / dividedBy;
//}
//
//double screenWidth(BuildContext context, {double dividedBy = 1}) {
//  return screenSize(context).width / dividedBy;
//}
//
//
//
//List<MultipleSelectItem> getAgeGroupForWidget(
//    AgeGroupResponse ageGroupResponse) {
//  if (ageGroupResponse != null) {
//    List<MultipleSelectItem> ageGroups = List.generate(
//      ageGroupResponse.data.length,
//      (index) => MultipleSelectItem.build(
//        value: ageGroupResponse.data[index].id,
//        display: '${ageGroupResponse.data[index].label}',
//        content: ' ${ageGroupResponse.data[index].label}',
//      ),
//    );
//
//    return ageGroups;
//  }
//  return null;
//}
//
/////common toast
//void showToast(String msg) {
//  Fluttertoast.showToast(
//    msg: msg,
//    toastLength: Toast.LENGTH_SHORT,
//    gravity: ToastGravity.BOTTOM,
//  );
//}
//
/////common toast
//void showToastLong(String msg) {
//  Fluttertoast.showToast(
//    msg: msg,
//    toastLength: Toast.LENGTH_LONG,
//    gravity: ToastGravity.BOTTOM,
//  );
//}
//
//void showToastConnection(String msg) {
//  Fluttertoast.showToast(
//    msg: msg,
//    toastLength: Toast.LENGTH_LONG,
//    gravity: ToastGravity.BOTTOM,
//  );
//}
//
//Future<File> downloadImage(
//    String dir, String filename, String networkImageUrl) async {
//  String dir = (await getApplicationDocumentsDirectory()).path;
//  File file = new File('$dir/$filename');
//  file.open(mode: FileMode.write);
//
//  print('file not found downloading from server');
//  Dio dio = new Dio(new BaseOptions(responseType: ResponseType.bytes));
////  Response fileDownloadResponse =
////      await dio.download(networkImageUrl, file.path);
//    var request = await dio.get(networkImageUrl);
//    var bytes = await request.data;//close();
//    await file.writeAsBytes(bytes);
//    print(file.path);
//  return file;
//}
