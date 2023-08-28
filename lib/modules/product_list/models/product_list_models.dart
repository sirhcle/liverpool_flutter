import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

// String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  final Status? status;
  final String? pageType;
  final PlpResults? plpResults;
  final String? nullSearch;
  

  ProductListModel({
    this.status,
    this.pageType,
    this.plpResults,
    this.nullSearch,
    
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      status: Status.fromJson(json["status"]),
      pageType: json["pageType"],
      plpResults: PlpResults.fromJson(json["plpResults"]),
      nullSearch: json["nullSearch"],
      // correctedQuery: json["correctedQuery"],
    );
  }
}

class PlpResults {
  final String label;
  final List<SortOption> sortOptions;
  final List<RecordProduct> records;

  PlpResults({
    required this.label,
    required this.sortOptions,
    required this.records,
  });

  factory PlpResults.fromJson(Map<String, dynamic> json) => PlpResults(
        label: json["label"],
        sortOptions: List<SortOption>.from(
            json["sortOptions"].map((x) => SortOption.fromJson(x))),
        records:
            List<RecordProduct>.from(json["records"].map((x) => RecordProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "sortOptions": List<dynamic>.from(sortOptions.map((x) => x.toJson())),
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class RecordProduct {
  final String? productId;
  final String? skuRepositoryId;
  final String? productDisplayName;
  
  final double? listPrice;
  final double? minimumListPrice;
  final double? maximumListPrice;
  final double? promoPrice;
  final double? minimumPromoPrice;
  final double? maximumPromoPrice;
  
  final String? brand;
  final String? seller;
  final String? category;
  
  final String? smImage;
  final String? lgImage;
  final String? xlImage;
  
  final List<VariantsColor>? variantsColor;
  final int? productRatingCount;
  final double? productAvgRating;

  RecordProduct({
    this.productId,
    this.skuRepositoryId,
    this.productDisplayName,

    this.listPrice,
    this.minimumListPrice,
    this.maximumListPrice,
    this.promoPrice,
    this.minimumPromoPrice,
    this.maximumPromoPrice,

    this.brand,
    this.seller,
    this.category,

    this.smImage,
    this.lgImage,
    this.xlImage,
    
    this.variantsColor,
    this.productRatingCount,
    this.productAvgRating,
  });

  factory RecordProduct.fromJson(Map<String, dynamic> json) => RecordProduct(
        productId: json["productId"],
        skuRepositoryId: json["skuRepositoryId"],
        productDisplayName: json["productDisplayName"],
        
        listPrice: json["listPrice"]?.toDouble(),
        minimumListPrice: json["minimumListPrice"]?.toDouble(),
        maximumListPrice: json["maximumListPrice"]?.toDouble(),
        promoPrice: json["promoPrice"]?.toDouble(),
        minimumPromoPrice: json["minimumPromoPrice"]?.toDouble(),
        maximumPromoPrice: json["maximumPromoPrice"]?.toDouble(),
        
        brand: json["brand"],
        seller: json["seller"],
        category: json["category"],
        
        smImage: json["smImage"],
        lgImage: json["lgImage"],
        xlImage: json["xlImage"],
        
        variantsColor: List<VariantsColor>.from(
            json["variantsColor"].map((x) => VariantsColor.fromJson(x))),
        productRatingCount: json["productRatingCount"],
        productAvgRating: json["productAvgRating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "skuRepositoryId": skuRepositoryId,
        "productDisplayName": productDisplayName,
        
        
        "listPrice": listPrice,
        "minimumListPrice": minimumListPrice,
        "maximumListPrice": maximumListPrice,
        "promoPrice": promoPrice,
        "minimumPromoPrice": minimumPromoPrice,
        "maximumPromoPrice": maximumPromoPrice,
        
        "brand": brand,
        "seller": seller,
        "category": category,
        
        "smImage": smImage,
        "lgImage": lgImage,
        "xlImage": xlImage,
        
        // "variantsColor":
        //     List<dynamic>.from(variantsColor!.map((x) => x.toJson())),
        "productRatingCount": productRatingCount,
        "productAvgRating": productAvgRating,
      };
}

class VariantsColor {
  final String? colorName;
  final String? colorHex;
  final String? colorImageUrl;
  final String? colorMainUrl;
  final String? skuId;

  VariantsColor({
    this.colorName,
    this.colorHex,
    this.colorImageUrl,
    this.colorMainUrl,
    this.skuId,
  });

  factory VariantsColor.fromJson(Map<String, dynamic> json) => VariantsColor(
        colorName: json["colorName"],
        colorHex: json["colorHex"],
        colorImageUrl: json["colorImageURL"],
        colorMainUrl: json["colorMainURL"],
        skuId: json["skuId"],
      );

  Map<String, dynamic> toJson() => {
        "colorName": colorName,
        "colorHex": colorHex,
        "colorImageURL": colorImageUrl,
        "colorMainURL": colorMainUrl,
        "skuId": skuId,
      };
}



class SortOption {
  final String sortBy;
  final String label;

  SortOption({
    required this.sortBy,
    required this.label,
  });

  factory SortOption.fromJson(Map<String, dynamic> json) => SortOption(
        sortBy: json["sortBy"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "sortBy": sortBy,
        "label": label,
      };
}

class Status {
  final String status;
  final int statusCode;

  Status({
    required this.status,
    required this.statusCode,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
      };
}