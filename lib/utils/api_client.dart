//import 'dart:async';
//import 'dart:io';
//
//import 'package:cookie_jar/cookie_jar.dart';
//import 'package:dio/dio.dart';
//
//import 'package:flutter/material.dart';
//
//class ApiClient {
////  ApiClient() {
////    initClient();
////  }
//
////for api client testing only
//  ApiClient.test({@required this.dio});
//
//  Dio dio;
//  BaseOptions _baseOptions;
//
////  initClient() async {
////    _baseOptions = new BaseOptions(
////        baseUrl: Urls.baseUrl,
////        connectTimeout: 30000,
////        receiveTimeout: 1000000,
////        contentType: ContentType.json,
////        followRedirects: true,
////        headers: {
////          HttpHeaders.contentTypeHeader: 'application/json',
////          HttpHeaders.acceptHeader: 'application/json',
////        },
////        responseType: ResponseType.json,
////        receiveDataWhenStatusError: true);
////
////    dio = Dio(_baseOptions);
////
////    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
////        (client) {
////      client.badCertificateCallback =
////          (X509Certificate cert, String host, int port) {
////        return true;
////      };
////    };
////
////    dio.interceptors.add(CookieManager(new CookieJar()));
////    dio.interceptors.add(InterceptorsWrapper(
////      onRequest: (RequestOptions reqOptions) {
////        return reqOptions;
////      },
////      onError: (DioError dioError) {
////        return dioError.response;
////      },
////    ));
////  }
//
//
//
////  /// search Flat
////  Future<Response> searchFlat(FlatFilterRequest filterRequest) {
////    print(Urls.SEARCH_FLAT +
////        "${FlatFilterRequest.removeNullParams(filterRequest.toJson())}");
////
////    return dio.get(Urls.SEARCH_FLAT +
////        "${FlatFilterRequest.removeNullParams(filterRequest.toJson())}");
////  }
//
////  /// search Flatmate
////  Future<Response> searchFlatmate(String searchText) {
////    dio.options.headers
////        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
////    return dio
////        .get(Urls.SEARCH_FLATMATE + "{\"search_param\"= \"$searchText\"}");
////  }
//
//
////  /// view Flat details
////  Future<Response> getFlatDetails(String flatId) {
////    return dio.get(Urls.VIEW_FLAT_DETAILS + flatId);
////  }
//
//
////  /// get preference
////  Future<Response> getPreferences() {
////    return dio.get(Urls.PREFERENCES);
////  }
//
////  /// exit flat
////  Future<Response> exitFlat() {
////    dio.options.headers
////        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
////    return dio.delete(Urls.EXIT_FLAT);
////  }
//
//
//
//
//
//
//
//  /// Verify Otp
//  Future<Response> verifyForgotPasswordOtp(VerifyOtpRequest verifyOtpRequest) {
//    return dio.post(Urls.VERIFY_FORGOT_PASSWORD_OTP, data: verifyOtpRequest);
//  }
//
//  /// set password
//  Future<Response> setPasswordApi(SetPasswordRequest setPasswordRequest) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.post(Urls.SET_PASSWORD, data: setPasswordRequest);
//  }
//
//  /// set forgot password
//  Future<Response> setForgotPasswordApi(
//      ForgotPasswordOtpRequest forgotPasswordOtpRequest) {
//    return dio.post(Urls.SET_FORGOT_PASSWORD, data: forgotPasswordOtpRequest);
//  }
//
//  /// user login
//  Future<Response> userLogin(UserLoginRequest userLoginRequest) {
//    return dio.post(Urls.USER_LOGIN, data: userLoginRequest);
//  }
//
//  Future<Response> googleAuth(GoogleAuthRequest googleAuthRequest) {
//    return dio.post(Urls.USER_GOOGLE_AUTH_LOGIN, data: googleAuthRequest);
//  }
//
//  Future<Response> facebookAuth(FacebookAuthRequest facebookAuthRequest) {
//    return dio.post(Urls.USER_FACEBOOK_AUTH_LOGIN, data: facebookAuthRequest);
//  }
//
//  /// add flat
//  Future<Response> addFlatApi(FormData addFlatRequestData) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.post(Urls.ADD_FLAT, data: addFlatRequestData);
//  }
//
//  /// update flat
//  Future<Response> updateFlatAPi(FormData updateFlatRequestData, id) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.patch(Urls.EDIT_FLAT + id + "/", data: updateFlatRequestData);
//  }
//
//  /// user details
//  Future<Response> getUserDetails(UserDetailsRequest userDetailsRequest) {
//    return dio.post(Urls.USER_DETAILS, data: userDetailsRequest);
//  }
//
//  ///edit  user details
//  Future<Response> editUserDetails(UpdateProfileRequest updateProfileRequest) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.post(Urls.EDIT_USER_DETAILS,
//        data: UpdateProfileRequest.removeNullParams(
//            updateProfileRequest.toJson()));
//  }
//
//  ///update user profile photo
//  Future<Response> uploadUserPhoto(FormData uploadPhotoRequest) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.post(Urls.USER_PHOTO, data: uploadPhotoRequest);
//  }
//
//  /// request access
//  Future<Response> requestAccessApi(RequestAccessRequest requestAccessRequest) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.post(Urls.REQUEST_ACCESS, data: requestAccessRequest);
//  }
//
//  /// add user to flat
//  Future<Response> addUserToFlat(AddUserToFlatRequest addUserToFlatRequest) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.post(Urls.ADD_USER_TO_FLAT, data: addUserToFlatRequest);
//  }
//
//  ///TASK
//  /// view TasK in Flat
//  Future<Response> viewTaskInFlat(String flatId) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.get(Urls.VIEW_TASK_IN_FLAT + flatId);
//  }
//
//  Future<Response> viewTaskDetails(String taskId) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.get(Urls.VIEW_TASK_DETAILS + taskId);
//  }
//
//  /// add TasK in Flat
//  Future<Response> addTask(AddTaskRequest addTaskRequest) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.post(Urls.ADD_TASK, data: addTaskRequest);
//  }
//
//  /// add TasK in Flat
//  Future<Response> updateTask(AddTaskRequest addTaskRequest, int id) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.patch(Urls.UPDATE_TASK + "$id" + "/", data: addTaskRequest);
//  }
//
//  /// add TasK in Flat
//  Future<Response> deleteTask({int id}) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.delete(Urls.DELETE_TASK,
//        data: {"id": id, "flat_id": ObjectFactory().prefs.getFlatId()});
//  }
//
//  ///update task status
//
//  Future<Response> updateTaskStatus(
//      UpdateTaskStatusRequest updateTaskStatusRequest) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.patch(Urls.UPDATE_TASK_STATUS, data: updateTaskStatusRequest);
//  }
//
//  ///Notice Board
//  /// fetch all post in notice board
//  Future<Response> fetchAllNotice() {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.get(Urls.FETCH_ALL_POST_IN_NOTICE_BOARD);
//  }
//
//  /// pin-unpin post in notice board
//  Future<Response> pinUnpinNotice(int noticeId) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.patch(Urls.PIN_UNPIN_NOTICE_IN_NOTICE_BOARD + "$noticeId" + "/");
//  }
//
//  /// pin-unpin post in notice board
//  Future<Response> deleteNoticeByID(int noticeId) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.delete(Urls.DELETE_NOTICE_BY_ID + "$noticeId" + "/");
//  }
//
//  ///update user profile photo
//  Future<Response> addNotice(FormData addNoticeRequest) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.post(Urls.ADD_NOTICE, data: addNoticeRequest);
//  }
//
//  ///update user profile photo
//  Future<Response> updateNotice(FormData updateNoticeRequest, int noticeId) {
//    dio.options.headers
//        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    return dio.patch(Urls.UPDATE_NOTICE + "$noticeId" + "/",
//        data: updateNoticeRequest);
//  }
//
//  ///add  feedback profile photo
//  Future<Response> addFeedback(FormData feedbackRequest) {
//    if (ObjectFactory().prefs.isLoggedIn()) {
//      dio.options.headers
//          .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
//    }
//    return dio.post(Urls.ADD_FEEDBACK, data: feedbackRequest);
//  }
//}
