class ProductModel {
  ProductModel({
    required this.status,
    required this.message,
    required this.totalDocs,
    required this.docs,
    required this.limit,
    required this.page,
    required this.nextPage,
    required this.prevPage,
    required this.totalPages,
     this.pagingCounter,
    required this.meta,
    required this.success,
  });
  late final int status;
  late final String message;
  late final int totalDocs;
  late final List<Docs> docs;
  late final int limit;
  late final int page;
  late final bool nextPage;
  late final bool prevPage;
  late final int totalPages;
  late final Null pagingCounter;
  late final String meta;
  late final bool success;
  
  ProductModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    totalDocs = json['totalDocs'];
    docs = List.from(json['docs']).map((e)=>Docs.fromJson(e)).toList();
    limit = json['limit'];
    page = json['page'];
    nextPage = json['nextPage'];
    prevPage = json['prevPage'];
    totalPages = json['totalPages'];
    pagingCounter = null;
    meta = json['meta'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['totalDocs'] = totalDocs;
    _data['docs'] = docs.map((e)=>e.toJson()).toList();
    _data['limit'] = limit;
    _data['page'] = page;
    _data['nextPage'] = nextPage;
    _data['prevPage'] = prevPage;
    _data['totalPages'] = totalPages;
    _data['pagingCounter'] = pagingCounter;
    _data['meta'] = meta;
    _data['success'] = success;
    return _data;
  }
}

class Docs {
  Docs({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String price;
  late final String image;
  late final Category category;
  
  Docs.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    category = Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    _data['image'] = image;
    _data['category'] = category.toJson();
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
  });
  late final String id;
  late final String name;
  late final String image;
    
  Category.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    image = json['image'];
    
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    return _data;
  }
}