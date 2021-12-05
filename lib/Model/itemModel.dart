import 'package:json_annotation/json_annotation.dart';
part 'itemModels.g.dart';

@JsonSerializable()
class ItemModel {
  String name;
  String price;
  String count;
  ItemModel({this.name, this.price, this.count});
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
//@jsonkey is used to metion the _id because method not support _variable
