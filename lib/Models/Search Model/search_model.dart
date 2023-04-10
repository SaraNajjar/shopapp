

class SearchModel
{
  late bool? status;
  late SearchData? data;

  SearchModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data = json['data'] == null ? null : SearchData.fromJson(json['data']);
  }

}

class SearchData
{
  late int? currentPage;
  List<ProductData> data = [];
  late String? firstPageUrl;
  late int? from;
  late int? lastPage;
  late String? lastPageUrl;
  late String? path;
  late int? perPage;
  late int? to;
  late int? total;

  SearchData.fromJson(Map<String, dynamic> json)
  {
    currentPage = json['current_page'];
    if(json['data'] != null)
    {
      json['data'].forEach((v)
      {
        data.add(ProductData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}


class ProductData {
  late int? id;
  dynamic price;
  dynamic oldPrice;
  late int? discount;
  late String? image;
  late String? name;
  late String? description;


  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
