import 'dart:async';
import 'dart:io';

import 'package:cartapp/src/models/State.dart';
import 'package:cartapp/src/models/category_response.dart';
import 'package:cartapp/src/models/latest_item_list_response.dart';
import 'package:cartapp/utils/constants.dart';
import 'package:cartapp/utils/object_factory.dart';
import 'package:cartapp/utils/validators.dart';
import 'package:dio/dio.dart';

import 'package:path/path.dart';

import 'base_bloc.dart';

/// api response of login is managed by AuthBloc
/// stream data is handled by StreamControllers

class BlocCategory extends Object with Validators implements BaseBloc {


  ///stream controller is broadcasting the search flat response

  StreamController<bool> _loading = new StreamController<bool>.broadcast();
  bool _isDisposed = false;
  StreamController<List<CategoryResponse>> _viewAllCategory =
  new StreamController<List<CategoryResponse>>.broadcast();

  StreamController<ItemListResponse> _viewLatestItemList =
  new StreamController<ItemListResponse>.broadcast();

  StreamController<ItemListResponse> _viewTrendingItemList =
  new StreamController<ItemListResponse>.broadcast();






  ///stream for adding search flat response
  Stream<List<CategoryResponse>> get viewAllCategoryResponse =>
      _viewAllCategory.stream;

  ///stream for adding search flat response
  Stream<ItemListResponse> get viewLatestItemListResponse =>
      _viewLatestItemList.stream;

  ///stream for adding search flat response
  Stream<ItemListResponse> get viewTrendingItemListResponse =>
      _viewTrendingItemList.stream;




  Stream<bool> get loadingListener => _loading.stream;





  StreamSink<bool> get loadingSink => _loading.sink;





  getAllCategory() async {
    if(_isDisposed) {
      return;
    }
    loadingSink.add(true);
    State state = await ObjectFactory().repository.getAllCategories();

    if (state is SuccessState) {
      _viewAllCategory.sink.add(state.value);
    } else if (state is ErrorState) {
      _viewAllCategory.sink.addError(Constants.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }

  getLatestItemList() async {
    if(_isDisposed) {
      return;
    }
    loadingSink.add(true);
    State state = await ObjectFactory().repository.getLatestItemList();

    if (state is SuccessState) {
      _viewLatestItemList.sink.add(state.value);
    } else if (state is ErrorState) {
      _viewLatestItemList.sink.addError(Constants.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }


  getTrendingItemList() async {
    if(_isDisposed) {
      return;
    }
    loadingSink.add(true);
    State state = await ObjectFactory().repository.getTrendingItemList();

    if (state is SuccessState) {
      _viewTrendingItemList.sink.add(state.value);
    } else if (state is ErrorState) {
      _viewTrendingItemList.sink.addError(Constants.SOME_ERROR_OCCURRED);
    }
    loadingSink.add(false);
  }







  ///disposing the stream if it is not using
  @override
  void dispose() {
    _loading?.close();
    _viewAllCategory?.close();
    _viewLatestItemList?.close();
    _viewTrendingItemList?.close();
  }
}


