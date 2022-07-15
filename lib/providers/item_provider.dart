import 'package:flutter/material.dart';
import 'package:keybrad/providers/category_provider.dart';

class Item with ChangeNotifier {
  final int id;
  final int postId;
  final String title;
  final String postDate;
  final String price;
  final String currency;
  final bool isNegociable;
  final bool isPickUp;
  final bool isDelivery;
  final String thumbNailUrl;
  final bool isFavorite;
  final String itemCategory; //it is Category but only for now
  //

  final int nbViews;
  final List images;
  final String description;
  final String itemSeller; //it is Seller class not string
  final String locationDetails;
  final String longtitude;
  final String latitude;

  Item(
      this.id,
      this.postId,
      this.title,
      this.postDate,
      this.price,
      this.currency,
      this.isNegociable,
      this.isPickUp,
      this.isDelivery,
      this.thumbNailUrl,
      this.isFavorite,
      this.itemCategory,
      this.nbViews,
      this.images,
      this.description,
      this.itemSeller,
      this.locationDetails,
      this.longtitude,
      this.latitude);
}
