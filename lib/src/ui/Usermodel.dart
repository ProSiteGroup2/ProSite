// ignore_for_file: file_names, prefer_collection_literals

class Productlist {
  Id? iId;
  String? productname;
  int? price;
  int? stock;
  String? size;
  String? category;
  String? description;
  String? brand;
  Id? seller;
  int? iV;
  String? imageUrl;
  String? publicId;
  String? status;

  Productlist(
      {this.iId,
      this.productname,
      this.price,
      this.stock,
      this.size,
      this.category,
      this.description,
      this.brand,
      this.seller,
      this.iV,
      this.imageUrl,
      this.publicId,
      this.status});

  Productlist.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    productname = json['productname'];
    price = json['price'];
    stock = json['stock'];
    size = json['size'];
    category = json['category'];
    description = json['description'];
    brand = json['brand'];
    seller = json['seller'] != null ? Id.fromJson(json['seller']) : null;
    iV = json['__v'];
    imageUrl = json['imageUrl'];
    publicId = json['publicId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['productname'] = productname;
    data['price'] = price;
    data['stock'] = stock;
    data['size'] = size;
    data['category'] = category;
    data['description'] = description;
    data['brand'] = brand;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    data['__v'] = iV;
    data['imageUrl'] = imageUrl;
    data['publicId'] = publicId;
    data['status'] = status;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$oid'] = oid;
    return data;
  }
}
