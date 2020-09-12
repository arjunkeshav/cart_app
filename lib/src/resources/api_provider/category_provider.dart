import 'package:cartapp/src/models/State.dart';
import 'package:cartapp/src/models/category_response.dart';
import 'package:cartapp/src/models/latest_item_list_response.dart';
import 'package:cartapp/utils/object_factory.dart';

class CategoryApiProvider {
  Future<State> getAllCategories() async {
    final response = await ObjectFactory().apiClient.getCategories();
    print(response.toString());
    if (response.statusCode == 200) {
      return State<List<CategoryResponse>>.success(
          categoryResponseFromJson(response.data));
    } else {
      return null;
    }
  }

  Future<State> getLatestItemList() async {
    final response = await ObjectFactory().apiClient.getLatestItemList();
    print(response.toString());
    if (response.statusCode == 200) {
      return State<ItemListResponse>.success(
          itemListResponseFromJson(response.data));
    } else {
      return null;
    }
  }

  Future<State> getTrendingItemList() async {
    final response = await ObjectFactory().apiClient.getTrendingItemList();
    print(response.toString());
    if (response.statusCode == 200) {
      return State<ItemListResponse>.success(
          itemListResponseFromJson(response.data));
    } else {
      return null;
    }
  }


}
