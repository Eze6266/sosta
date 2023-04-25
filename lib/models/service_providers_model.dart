import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceProviderModel {
  String? id;
  String? name;
  String? cat;
  String? price;
  String? maxprice;
  String? ratings;
  String? description;
  String? imgurl;
  String? phone;
  String? userBookingtime;
  String? userBookingdate;
  String? prieOfferedUser;

  ServiceProviderModel(
      {this.id,
      this.name,
      this.cat,
      this.price,
      this.maxprice,
      this.ratings,
      this.description,
      this.phone,
      this.imgurl});

  factory ServiceProviderModel.fromMap(Map<String, dynamic> map) {
    return ServiceProviderModel(
        id: map['id'].toString(),
        name: map['name'],
        phone: map["user"]["phone_number"],
        //cat: map['cat'] != null ? map['cat'] as String : null,
        price: map['min_charge'],
        maxprice: map["max_charge"],
        description: map["description"],
        imgurl: map["user"]['photo_url']
        //ratings: map['ratings'] != null ? map['ratings'] as String : null,
        );
  }
}
