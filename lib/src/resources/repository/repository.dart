import 'package:cartapp/src/models/State.dart';
import 'package:cartapp/src/resources/api_provider/category_provider.dart';



/// Repository is an intermediary class between network and data
class Repository {
  final categoryApiProvider = CategoryApiProvider();


  ///all categories
  Future<State> getAllCategories() =>
      categoryApiProvider.getAllCategories();

  ///all categories
  Future<State> getLatestItemList() =>
      categoryApiProvider.getLatestItemList();

  ///all categories
  Future<State> getTrendingItemList() =>
      categoryApiProvider.getTrendingItemList();


}
