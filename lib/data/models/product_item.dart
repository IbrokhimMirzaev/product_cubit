import 'package:assistant_task/data/models/att_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(name: 'attributes')
  AttItem attributeItem;

  ProductItem({
    required this.id,
    required this.attributeItem,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}