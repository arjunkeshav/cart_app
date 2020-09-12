// To parse this JSON data, do
//
//     final itemListResponse = itemListResponseFromJson(jsonString);

import 'dart:convert';

ItemListResponse itemListResponseFromJson(String str) => ItemListResponse.fromJson(json.decode(str));

String itemListResponseToJson(ItemListResponse data) => json.encode(data.toJson());

class ItemListResponse {
  ItemListResponse({
    this.products,
    this.params,
  });

  List<Product> products;
  Params params;

  factory ItemListResponse.fromJson(Map<String, dynamic> json) => ItemListResponse(
    products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    params: json["params"] == null ? null : Params.fromJson(json["params"]),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    "params": params == null ? null : params.toJson(),
  };
}

class Params {
  Params({
    this.area,
    this.useCaching,
    this.extend,
    this.customExtend,
    this.pname,
    this.pshort,
    this.pfull,
    this.pkeywords,
    this.feature,
    this.type,
    this.page,
    this.action,
    this.filterVariants,
    this.featuresHash,
    this.limit,
    this.bid,
    this.match,
    this.tracking,
    this.getFrontendUrls,
    this.itemsPerPage,
    this.applyDisabledFilters,
    this.loadProductsExtraData,
    this.storefront,
    this.sortBy,
    this.sortOrder,
    this.status,
    this.includeChildVariations,
    this.groupChildVariations,
    this.sortOrderRev,
    this.totalItems,
  });

  Area area;
  bool useCaching;
  List<String> extend;
  List<dynamic> customExtend;
  String pname;
  String pshort;
  String pfull;
  String pkeywords;
  List<dynamic> feature;
  String type;
  int page;
  String action;
  List<dynamic> filterVariants;
  String featuresHash;
  int limit;
  int bid;
  String match;
  List<dynamic> tracking;
  bool getFrontendUrls;
  int itemsPerPage;
  String applyDisabledFilters;
  bool loadProductsExtraData;
  dynamic storefront;
  String sortBy;
  String sortOrder;
  Area status;
  bool includeChildVariations;
  bool groupChildVariations;
  String sortOrderRev;
  String totalItems;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
    area: json["area"] == null ? null : areaValues.map[json["area"]],
    useCaching: json["use_caching"] == null ? null : json["use_caching"],
    extend: json["extend"] == null ? null : List<String>.from(json["extend"].map((x) => x)),
    customExtend: json["custom_extend"] == null ? null : List<dynamic>.from(json["custom_extend"].map((x) => x)),
    pname: json["pname"] == null ? null : json["pname"],
    pshort: json["pshort"] == null ? null : json["pshort"],
    pfull: json["pfull"] == null ? null : json["pfull"],
    pkeywords: json["pkeywords"] == null ? null : json["pkeywords"],
    feature: json["feature"] == null ? null : List<dynamic>.from(json["feature"].map((x) => x)),
    type: json["type"] == null ? null : json["type"],
    page: json["page"] == null ? null : json["page"],
    action: json["action"] == null ? null : json["action"],
    filterVariants: json["filter_variants"] == null ? null : List<dynamic>.from(json["filter_variants"].map((x) => x)),
    featuresHash: json["features_hash"] == null ? null : json["features_hash"],
    limit: json["limit"] == null ? null : json["limit"],
    bid: json["bid"] == null ? null : json["bid"],
    match: json["match"] == null ? null : json["match"],
    tracking: json["tracking"] == null ? null : List<dynamic>.from(json["tracking"].map((x) => x)),
    getFrontendUrls: json["get_frontend_urls"] == null ? null : json["get_frontend_urls"],
    itemsPerPage: json["items_per_page"] == null ? null : json["items_per_page"],
    applyDisabledFilters: json["apply_disabled_filters"] == null ? null : json["apply_disabled_filters"],
    loadProductsExtraData: json["load_products_extra_data"] == null ? null : json["load_products_extra_data"],
    storefront: json["storefront"],
    sortBy: json["sort_by"] == null ? null : json["sort_by"],
    sortOrder: json["sort_order"] == null ? null : json["sort_order"],
    status: json["status"] == null ? null : areaValues.map[json["status"]],
    includeChildVariations: json["include_child_variations"] == null ? null : json["include_child_variations"],
    groupChildVariations: json["group_child_variations"] == null ? null : json["group_child_variations"],
    sortOrderRev: json["sort_order_rev"] == null ? null : json["sort_order_rev"],
    totalItems: json["total_items"] == null ? null : json["total_items"],
  );

  Map<String, dynamic> toJson() => {
    "area": area == null ? null : areaValues.reverse[area],
    "use_caching": useCaching == null ? null : useCaching,
    "extend": extend == null ? null : List<dynamic>.from(extend.map((x) => x)),
    "custom_extend": customExtend == null ? null : List<dynamic>.from(customExtend.map((x) => x)),
    "pname": pname == null ? null : pname,
    "pshort": pshort == null ? null : pshort,
    "pfull": pfull == null ? null : pfull,
    "pkeywords": pkeywords == null ? null : pkeywords,
    "feature": feature == null ? null : List<dynamic>.from(feature.map((x) => x)),
    "type": type == null ? null : type,
    "page": page == null ? null : page,
    "action": action == null ? null : action,
    "filter_variants": filterVariants == null ? null : List<dynamic>.from(filterVariants.map((x) => x)),
    "features_hash": featuresHash == null ? null : featuresHash,
    "limit": limit == null ? null : limit,
    "bid": bid == null ? null : bid,
    "match": match == null ? null : match,
    "tracking": tracking == null ? null : List<dynamic>.from(tracking.map((x) => x)),
    "get_frontend_urls": getFrontendUrls == null ? null : getFrontendUrls,
    "items_per_page": itemsPerPage == null ? null : itemsPerPage,
    "apply_disabled_filters": applyDisabledFilters == null ? null : applyDisabledFilters,
    "load_products_extra_data": loadProductsExtraData == null ? null : loadProductsExtraData,
    "storefront": storefront,
    "sort_by": sortBy == null ? null : sortBy,
    "sort_order": sortOrder == null ? null : sortOrder,
    "status": status == null ? null : areaValues.reverse[status],
    "include_child_variations": includeChildVariations == null ? null : includeChildVariations,
    "group_child_variations": groupChildVariations == null ? null : groupChildVariations,
    "sort_order_rev": sortOrderRev == null ? null : sortOrderRev,
    "total_items": totalItems == null ? null : totalItems,
  };
}

enum Area { A, M }

final areaValues = EnumValues({
  "A": Area.A,
  "M": Area.M
});

class Product {
  Product({
    this.productId,
    this.product,
    this.productType,
    this.parentProductId,
    this.productCode,
    this.status,
    this.companyId,
    this.listPrice,
    this.amount,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.shippingFreight,
    this.lowAvailLimit,
    this.timestamp,
    this.updatedTimestamp,
    this.usergroupIds,
    this.isEdp,
    this.edpShipping,
    this.unlimitedDownload,
    this.tracking,
    this.freeShipping,
    this.zeroPriceAction,
    this.isPbp,
    this.isOp,
    this.isOper,
    this.isReturnable,
    this.returnPeriod,
    this.availSince,
    this.outOfStockActions,
    this.localization,
    this.minQty,
    this.maxQty,
    this.qtyStep,
    this.listQtyCount,
    this.taxIds,
    this.ageVerification,
    this.ageLimit,
    this.optionsType,
    this.exceptionsType,
    this.detailsLayout,
    this.shippingParams,
    this.facebookObjType,
    this.buyNowUrl,
    this.restrictPaymentId,
    this.price,
    this.categoryIds,
    this.seoName,
    this.seoPath,
    this.averageRating,
    this.discussionType,
    this.discussionThreadId,
    this.mainCategory,
    this.abVgVideos,
    this.variationFeatures,
    this.basePrice,
    this.selectedOptions,
    this.hasOptions,
    this.productOptions,
    this.discounts,
    this.productFeatures,
    this.qtyContent,
    this.mainPair,
    this.listDiscount,
    this.listDiscountPrc,
    this.imagePairs,
    this.variationFeatureIds,
    this.variationFeatureCollection,
    this.variationGroupId,
    this.variationGroupCode,
    this.variationParentProductId,
    this.variationSubGroupId,
    this.variationName,
  });

  String productId;
  String product;
  String productType;
  String parentProductId;
  String productCode;
  Area status;
  String companyId;
  String listPrice;
  String amount;
  String weight;
  String length;
  String width;
  String height;
  String shippingFreight;
  String lowAvailLimit;
  String timestamp;
  String updatedTimestamp;
  String usergroupIds;
  AgeVerification isEdp;
  AgeVerification edpShipping;
  AgeVerification unlimitedDownload;
  String tracking;
  AgeVerification freeShipping;
  String zeroPriceAction;
  AgeVerification isPbp;
  AgeVerification isOp;
  AgeVerification isOper;
  AgeVerification isReturnable;
  String returnPeriod;
  String availSince;
  String outOfStockActions;
  String localization;
  String minQty;
  String maxQty;
  String qtyStep;
  String listQtyCount;
  String taxIds;
  AgeVerification ageVerification;
  String ageLimit;
  String optionsType;
  String exceptionsType;
  String detailsLayout;
  String shippingParams;
  String facebookObjType;
  String buyNowUrl;
  dynamic restrictPaymentId;
  String price;
  List<int> categoryIds;
  String seoName;
  String seoPath;
  dynamic averageRating;
  String discussionType;
  String discussionThreadId;
  int mainCategory;
  bool abVgVideos;
  dynamic variationFeatures;
  String basePrice;
  List<dynamic> selectedOptions;
  bool hasOptions;
  List<dynamic> productOptions;
  Discounts discounts;
  dynamic productFeatures;
  List<dynamic> qtyContent;
  Pair mainPair;
  int listDiscount;
  String listDiscountPrc;
  Map<String, Pair> imagePairs;
  Map<String, String> variationFeatureIds;
  Map<String, VariationFeatureCollection> variationFeatureCollection;
  int variationGroupId;
  String variationGroupCode;
  int variationParentProductId;
  String variationSubGroupId;
  String variationName;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"] == null ? null : json["product_id"],
    product: json["product"] == null ? null : json["product"],
    productType: json["product_type"] == null ? null : json["product_type"],
    parentProductId: json["parent_product_id"] == null ? null : json["parent_product_id"],
    productCode: json["product_code"] == null ? null : json["product_code"],
    status: json["status"] == null ? null : areaValues.map[json["status"]],
    companyId: json["company_id"] == null ? null : json["company_id"],
    listPrice: json["list_price"] == null ? null : json["list_price"],
    amount: json["amount"] == null ? null : json["amount"],
    weight: json["weight"] == null ? null : json["weight"],
    length: json["length"] == null ? null : json["length"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    shippingFreight: json["shipping_freight"] == null ? null : json["shipping_freight"],
    lowAvailLimit: json["low_avail_limit"] == null ? null : json["low_avail_limit"],
    timestamp: json["timestamp"] == null ? null : json["timestamp"],
    updatedTimestamp: json["updated_timestamp"] == null ? null : json["updated_timestamp"],
    usergroupIds: json["usergroup_ids"] == null ? null : json["usergroup_ids"],
    isEdp: json["is_edp"] == null ? null : ageVerificationValues.map[json["is_edp"]],
    edpShipping: json["edp_shipping"] == null ? null : ageVerificationValues.map[json["edp_shipping"]],
    unlimitedDownload: json["unlimited_download"] == null ? null : ageVerificationValues.map[json["unlimited_download"]],
    tracking: json["tracking"] == null ? null : json["tracking"],
    freeShipping: json["free_shipping"] == null ? null : ageVerificationValues.map[json["free_shipping"]],
    zeroPriceAction: json["zero_price_action"] == null ? null : json["zero_price_action"],
    isPbp: json["is_pbp"] == null ? null : ageVerificationValues.map[json["is_pbp"]],
    isOp: json["is_op"] == null ? null : ageVerificationValues.map[json["is_op"]],
    isOper: json["is_oper"] == null ? null : ageVerificationValues.map[json["is_oper"]],
    isReturnable: json["is_returnable"] == null ? null : ageVerificationValues.map[json["is_returnable"]],
    returnPeriod: json["return_period"] == null ? null : json["return_period"],
    availSince: json["avail_since"] == null ? null : json["avail_since"],
    outOfStockActions: json["out_of_stock_actions"] == null ? null : json["out_of_stock_actions"],
    localization: json["localization"] == null ? null : json["localization"],
    minQty: json["min_qty"] == null ? null : json["min_qty"],
    maxQty: json["max_qty"] == null ? null : json["max_qty"],
    qtyStep: json["qty_step"] == null ? null : json["qty_step"],
    listQtyCount: json["list_qty_count"] == null ? null : json["list_qty_count"],
    taxIds: json["tax_ids"] == null ? null : json["tax_ids"],
    ageVerification: json["age_verification"] == null ? null : ageVerificationValues.map[json["age_verification"]],
    ageLimit: json["age_limit"] == null ? null : json["age_limit"],
    optionsType: json["options_type"] == null ? null : json["options_type"],
    exceptionsType: json["exceptions_type"] == null ? null : json["exceptions_type"],
    detailsLayout: json["details_layout"] == null ? null : json["details_layout"],
    shippingParams: json["shipping_params"] == null ? null : json["shipping_params"],
    facebookObjType: json["facebook_obj_type"] == null ? null : json["facebook_obj_type"],
    buyNowUrl: json["buy_now_url"] == null ? null : json["buy_now_url"],
    restrictPaymentId: json["restrict_payment_id"],
    price: json["price"] == null ? null : json["price"],
    categoryIds: json["category_ids"] == null ? null : List<int>.from(json["category_ids"].map((x) => x)),
    seoName: json["seo_name"] == null ? null : json["seo_name"],
    seoPath: json["seo_path"] == null ? null : json["seo_path"],
    averageRating: json["average_rating"],
    discussionType: json["discussion_type"] == null ? null : json["discussion_type"],
    discussionThreadId: json["discussion_thread_id"] == null ? null : json["discussion_thread_id"],
    mainCategory: json["main_category"] == null ? null : json["main_category"],
    abVgVideos: json["ab__vg_videos"] == null ? null : json["ab__vg_videos"],
    variationFeatures: json["variation_features"],
    basePrice: json["base_price"] == null ? null : json["base_price"],
    selectedOptions: json["selected_options"] == null ? null : List<dynamic>.from(json["selected_options"].map((x) => x)),
    hasOptions: json["has_options"] == null ? null : json["has_options"],
    productOptions: json["product_options"] == null ? null : List<dynamic>.from(json["product_options"].map((x) => x)),
    discounts: json["discounts"] == null ? null : Discounts.fromJson(json["discounts"]),
    productFeatures: json["product_features"],
    qtyContent: json["qty_content"] == null ? null : List<dynamic>.from(json["qty_content"].map((x) => x)),
    mainPair: json["main_pair"] == null ? null : Pair.fromJson(json["main_pair"]),
    listDiscount: json["list_discount"] == null ? null : json["list_discount"],
    listDiscountPrc: json["list_discount_prc"] == null ? null : json["list_discount_prc"],
    imagePairs: json["image_pairs"] == null ? null : Map.from(json["image_pairs"]).map((k, v) => MapEntry<String, Pair>(k, Pair.fromJson(v))),
    variationFeatureIds: json["variation_feature_ids"] == null ? null : Map.from(json["variation_feature_ids"]).map((k, v) => MapEntry<String, String>(k, v)),
    variationFeatureCollection: json["variation_feature_collection"] == null ? null : Map.from(json["variation_feature_collection"]).map((k, v) => MapEntry<String, VariationFeatureCollection>(k, VariationFeatureCollection.fromJson(v))),
    variationGroupId: json["variation_group_id"] == null ? null : json["variation_group_id"],
    variationGroupCode: json["variation_group_code"] == null ? null : json["variation_group_code"],
    variationParentProductId: json["variation_parent_product_id"] == null ? null : json["variation_parent_product_id"],
    variationSubGroupId: json["variation_sub_group_id"] == null ? null : json["variation_sub_group_id"],
    variationName: json["variation_name"] == null ? null : json["variation_name"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId == null ? null : productId,
    "product": product == null ? null : product,
    "product_type": productType == null ? null : productType,
    "parent_product_id": parentProductId == null ? null : parentProductId,
    "product_code": productCode == null ? null : productCode,
    "status": status == null ? null : areaValues.reverse[status],
    "company_id": companyId == null ? null : companyId,
    "list_price": listPrice == null ? null : listPrice,
    "amount": amount == null ? null : amount,
    "weight": weight == null ? null : weight,
    "length": length == null ? null : length,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "shipping_freight": shippingFreight == null ? null : shippingFreight,
    "low_avail_limit": lowAvailLimit == null ? null : lowAvailLimit,
    "timestamp": timestamp == null ? null : timestamp,
    "updated_timestamp": updatedTimestamp == null ? null : updatedTimestamp,
    "usergroup_ids": usergroupIds == null ? null : usergroupIds,
    "is_edp": isEdp == null ? null : ageVerificationValues.reverse[isEdp],
    "edp_shipping": edpShipping == null ? null : ageVerificationValues.reverse[edpShipping],
    "unlimited_download": unlimitedDownload == null ? null : ageVerificationValues.reverse[unlimitedDownload],
    "tracking": tracking == null ? null : tracking,
    "free_shipping": freeShipping == null ? null : ageVerificationValues.reverse[freeShipping],
    "zero_price_action": zeroPriceAction == null ? null : zeroPriceAction,
    "is_pbp": isPbp == null ? null : ageVerificationValues.reverse[isPbp],
    "is_op": isOp == null ? null : ageVerificationValues.reverse[isOp],
    "is_oper": isOper == null ? null : ageVerificationValues.reverse[isOper],
    "is_returnable": isReturnable == null ? null : ageVerificationValues.reverse[isReturnable],
    "return_period": returnPeriod == null ? null : returnPeriod,
    "avail_since": availSince == null ? null : availSince,
    "out_of_stock_actions": outOfStockActions == null ? null : outOfStockActions,
    "localization": localization == null ? null : localization,
    "min_qty": minQty == null ? null : minQty,
    "max_qty": maxQty == null ? null : maxQty,
    "qty_step": qtyStep == null ? null : qtyStep,
    "list_qty_count": listQtyCount == null ? null : listQtyCount,
    "tax_ids": taxIds == null ? null : taxIds,
    "age_verification": ageVerification == null ? null : ageVerificationValues.reverse[ageVerification],
    "age_limit": ageLimit == null ? null : ageLimit,
    "options_type": optionsType == null ? null : optionsType,
    "exceptions_type": exceptionsType == null ? null : exceptionsType,
    "details_layout": detailsLayout == null ? null : detailsLayout,
    "shipping_params": shippingParams == null ? null : shippingParams,
    "facebook_obj_type": facebookObjType == null ? null : facebookObjType,
    "buy_now_url": buyNowUrl == null ? null : buyNowUrl,
    "restrict_payment_id": restrictPaymentId,
    "price": price == null ? null : price,
    "category_ids": categoryIds == null ? null : List<dynamic>.from(categoryIds.map((x) => x)),
    "seo_name": seoName == null ? null : seoName,
    "seo_path": seoPath == null ? null : seoPath,
    "average_rating": averageRating,
    "discussion_type": discussionType == null ? null : discussionType,
    "discussion_thread_id": discussionThreadId == null ? null : discussionThreadId,
    "main_category": mainCategory == null ? null : mainCategory,
    "ab__vg_videos": abVgVideos == null ? null : abVgVideos,
    "variation_features": variationFeatures,
    "base_price": basePrice == null ? null : basePrice,
    "selected_options": selectedOptions == null ? null : List<dynamic>.from(selectedOptions.map((x) => x)),
    "has_options": hasOptions == null ? null : hasOptions,
    "product_options": productOptions == null ? null : List<dynamic>.from(productOptions.map((x) => x)),
    "discounts": discounts == null ? null : discounts.toJson(),
    "product_features": productFeatures,
    "qty_content": qtyContent == null ? null : List<dynamic>.from(qtyContent.map((x) => x)),
    "main_pair": mainPair == null ? null : mainPair.toJson(),
    "list_discount": listDiscount == null ? null : listDiscount,
    "list_discount_prc": listDiscountPrc == null ? null : listDiscountPrc,
    "image_pairs": imagePairs == null ? null : Map.from(imagePairs).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "variation_feature_ids": variationFeatureIds == null ? null : Map.from(variationFeatureIds).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "variation_feature_collection": variationFeatureCollection == null ? null : Map.from(variationFeatureCollection).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "variation_group_id": variationGroupId == null ? null : variationGroupId,
    "variation_group_code": variationGroupCode == null ? null : variationGroupCode,
    "variation_parent_product_id": variationParentProductId == null ? null : variationParentProductId,
    "variation_sub_group_id": variationSubGroupId == null ? null : variationSubGroupId,
    "variation_name": variationName == null ? null : variationName,
  };
}

enum AgeVerification { N, Y }

final ageVerificationValues = EnumValues({
  "N": AgeVerification.N,
  "Y": AgeVerification.Y
});

class Discounts {
  Discounts({
    this.a,
    this.p,
  });

  int a;
  int p;

  factory Discounts.fromJson(Map<String, dynamic> json) => Discounts(
    a: json["A"] == null ? null : json["A"],
    p: json["P"] == null ? null : json["P"],
  );

  Map<String, dynamic> toJson() => {
    "A": a == null ? null : a,
    "P": p == null ? null : p,
  };
}

class Pair {
  Pair({
    this.pairId,
    this.imageId,
    this.detailedId,
    this.position,
    this.detailed,
  });

  String pairId;
  String imageId;
  String detailedId;
  String position;
  Detailed detailed;

  factory Pair.fromJson(Map<String, dynamic> json) => Pair(
    pairId: json["pair_id"] == null ? null : json["pair_id"],
    imageId: json["image_id"] == null ? null : json["image_id"],
    detailedId: json["detailed_id"] == null ? null : json["detailed_id"],
    position: json["position"] == null ? null : json["position"],
    detailed: json["detailed"] == null ? null : Detailed.fromJson(json["detailed"]),
  );

  Map<String, dynamic> toJson() => {
    "pair_id": pairId == null ? null : pairId,
    "image_id": imageId == null ? null : imageId,
    "detailed_id": detailedId == null ? null : detailedId,
    "position": position == null ? null : position,
    "detailed": detailed == null ? null : detailed.toJson(),
  };
}

class Detailed {
  Detailed({
    this.objectId,
    this.objectType,
    this.type,
    this.imagePath,
    this.alt,
    this.imageX,
    this.imageY,
    this.httpImagePath,
    this.httpsImagePath,
    this.absolutePath,
    this.relativePath,
    this.isHighRes,
  });

  String objectId;
  ObjectType objectType;
  Area type;
  String imagePath;
  String alt;
  String imageX;
  String imageY;
  String httpImagePath;
  String httpsImagePath;
  String absolutePath;
  String relativePath;
  bool isHighRes;

  factory Detailed.fromJson(Map<String, dynamic> json) => Detailed(
    objectId: json["object_id"] == null ? null : json["object_id"],
    objectType: json["object_type"] == null ? null : objectTypeValues.map[json["object_type"]],
    type: json["type"] == null ? null : areaValues.map[json["type"]],
    imagePath: json["image_path"] == null ? null : json["image_path"],
    alt: json["alt"] == null ? null : json["alt"],
    imageX: json["image_x"] == null ? null : json["image_x"],
    imageY: json["image_y"] == null ? null : json["image_y"],
    httpImagePath: json["http_image_path"] == null ? null : json["http_image_path"],
    httpsImagePath: json["https_image_path"] == null ? null : json["https_image_path"],
    absolutePath: json["absolute_path"] == null ? null : json["absolute_path"],
    relativePath: json["relative_path"] == null ? null : json["relative_path"],
    isHighRes: json["is_high_res"] == null ? null : json["is_high_res"],
  );

  Map<String, dynamic> toJson() => {
    "object_id": objectId == null ? null : objectId,
    "object_type": objectType == null ? null : objectTypeValues.reverse[objectType],
    "type": type == null ? null : areaValues.reverse[type],
    "image_path": imagePath == null ? null : imagePath,
    "alt": alt == null ? null : alt,
    "image_x": imageX == null ? null : imageX,
    "image_y": imageY == null ? null : imageY,
    "http_image_path": httpImagePath == null ? null : httpImagePath,
    "https_image_path": httpsImagePath == null ? null : httpsImagePath,
    "absolute_path": absolutePath == null ? null : absolutePath,
    "relative_path": relativePath == null ? null : relativePath,
    "is_high_res": isHighRes == null ? null : isHighRes,
  };
}

enum ObjectType { PRODUCT }

final objectTypeValues = EnumValues({
  "product": ObjectType.PRODUCT
});

class ProductFeature {
  ProductFeature({
    this.featureId,
    this.value,
    this.valueInt,
    this.variantId,
    this.featureType,
    this.description,
    this.prefix,
    this.suffix,
    this.variant,
    this.parentId,
    this.displayOnHeader,
    this.displayOnCatalog,
    this.displayOnProduct,
    this.variants,
    this.featuresHash,
  });

  String featureId;
  String value;
  String valueInt;
  String variantId;
  FeatureType featureType;
  String description;
  String prefix;
  String suffix;
  String variant;
  String parentId;
  AgeVerification displayOnHeader;
  AgeVerification displayOnCatalog;
  AgeVerification displayOnProduct;
  Map<String, Variant> variants;
  String featuresHash;

  factory ProductFeature.fromJson(Map<String, dynamic> json) => ProductFeature(
    featureId: json["feature_id"] == null ? null : json["feature_id"],
    value: json["value"] == null ? null : json["value"],
    valueInt: json["value_int"] == null ? null : json["value_int"],
    variantId: json["variant_id"] == null ? null : json["variant_id"],
    featureType: json["feature_type"] == null ? null : featureTypeValues.map[json["feature_type"]],
    description: json["description"] == null ? null : json["description"],
    prefix: json["prefix"] == null ? null : json["prefix"],
    suffix: json["suffix"] == null ? null : json["suffix"],
    variant: json["variant"] == null ? null : json["variant"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    displayOnHeader: json["display_on_header"] == null ? null : ageVerificationValues.map[json["display_on_header"]],
    displayOnCatalog: json["display_on_catalog"] == null ? null : ageVerificationValues.map[json["display_on_catalog"]],
    displayOnProduct: json["display_on_product"] == null ? null : ageVerificationValues.map[json["display_on_product"]],
    variants: json["variants"] == null ? null : Map.from(json["variants"]).map((k, v) => MapEntry<String, Variant>(k, Variant.fromJson(v))),
    featuresHash: json["features_hash"] == null ? null : json["features_hash"],
  );

  Map<String, dynamic> toJson() => {
    "feature_id": featureId == null ? null : featureId,
    "value": value == null ? null : value,
    "value_int": valueInt == null ? null : valueInt,
    "variant_id": variantId == null ? null : variantId,
    "feature_type": featureType == null ? null : featureTypeValues.reverse[featureType],
    "description": description == null ? null : description,
    "prefix": prefix == null ? null : prefix,
    "suffix": suffix == null ? null : suffix,
    "variant": variant == null ? null : variant,
    "parent_id": parentId == null ? null : parentId,
    "display_on_header": displayOnHeader == null ? null : ageVerificationValues.reverse[displayOnHeader],
    "display_on_catalog": displayOnCatalog == null ? null : ageVerificationValues.reverse[displayOnCatalog],
    "display_on_product": displayOnProduct == null ? null : ageVerificationValues.reverse[displayOnProduct],
    "variants": variants == null ? null : Map.from(variants).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "features_hash": featuresHash == null ? null : featuresHash,
  };
}

enum FeatureType { S, T }

final featureTypeValues = EnumValues({
  "S": FeatureType.S,
  "T": FeatureType.T
});

class Variant {
  Variant({
    this.value,
    this.valueInt,
    this.variantId,
    this.variant,
    this.imagePairs,
  });

  String value;
  String valueInt;
  String variantId;
  String variant;
  bool imagePairs;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    value: json["value"] == null ? null : json["value"],
    valueInt: json["value_int"] == null ? null : json["value_int"],
    variantId: json["variant_id"] == null ? null : json["variant_id"],
    variant: json["variant"] == null ? null : json["variant"],
    imagePairs: json["image_pairs"] == null ? null : json["image_pairs"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "value_int": valueInt == null ? null : valueInt,
    "variant_id": variantId == null ? null : variantId,
    "variant": variant == null ? null : variant,
    "image_pairs": imagePairs == null ? null : imagePairs,
  };
}

class VariationFeatureCollection {
  VariationFeatureCollection({
    this.featureId,
    this.purpose,
  });

  String featureId;
  String purpose;

  factory VariationFeatureCollection.fromJson(Map<String, dynamic> json) => VariationFeatureCollection(
    featureId: json["feature_id"] == null ? null : json["feature_id"],
    purpose: json["purpose"] == null ? null : json["purpose"],
  );

  Map<String, dynamic> toJson() => {
    "feature_id": featureId == null ? null : featureId,
    "purpose": purpose == null ? null : purpose,
  };
}

class VariationFeature {
  VariationFeature({
    this.featureId,
    this.featureStyle,
    this.position,
    this.purpose,
    this.displayOnCatalog,
    this.description,
    this.prefix,
    this.suffix,
    this.purposePosition,
    this.variant,
    this.variantId,
    this.variantPosition,
  });

  String featureId;
  String featureStyle;
  String position;
  String purpose;
  AgeVerification displayOnCatalog;
  String description;
  String prefix;
  String suffix;
  String purposePosition;
  String variant;
  String variantId;
  String variantPosition;

  factory VariationFeature.fromJson(Map<String, dynamic> json) => VariationFeature(
    featureId: json["feature_id"] == null ? null : json["feature_id"],
    featureStyle: json["feature_style"] == null ? null : json["feature_style"],
    position: json["position"] == null ? null : json["position"],
    purpose: json["purpose"] == null ? null : json["purpose"],
    displayOnCatalog: json["display_on_catalog"] == null ? null : ageVerificationValues.map[json["display_on_catalog"]],
    description: json["description"] == null ? null : json["description"],
    prefix: json["prefix"] == null ? null : json["prefix"],
    suffix: json["suffix"] == null ? null : json["suffix"],
    purposePosition: json["purpose_position"] == null ? null : json["purpose_position"],
    variant: json["variant"] == null ? null : json["variant"],
    variantId: json["variant_id"] == null ? null : json["variant_id"],
    variantPosition: json["variant_position"] == null ? null : json["variant_position"],
  );

  Map<String, dynamic> toJson() => {
    "feature_id": featureId == null ? null : featureId,
    "feature_style": featureStyle == null ? null : featureStyle,
    "position": position == null ? null : position,
    "purpose": purpose == null ? null : purpose,
    "display_on_catalog": displayOnCatalog == null ? null : ageVerificationValues.reverse[displayOnCatalog],
    "description": description == null ? null : description,
    "prefix": prefix == null ? null : prefix,
    "suffix": suffix == null ? null : suffix,
    "purpose_position": purposePosition == null ? null : purposePosition,
    "variant": variant == null ? null : variant,
    "variant_id": variantId == null ? null : variantId,
    "variant_position": variantPosition == null ? null : variantPosition,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
