import 'package:json_annotation/json_annotation.dart';

part 'att_item.g.dart';

@JsonSerializable(explicitToJson: true)
class AttItem {

  @JsonKey(defaultValue: "", name: 'name')
  String name;

  @JsonKey(defaultValue: 0, name: 'product_id')
  int productId;

  @JsonKey(defaultValue: "", name: 'createdAt')
  String createdAt;

  AttItem({
    required this.name,
    required this.productId,
    required this.createdAt,
  });

  factory AttItem.fromJson(Map<String, dynamic> json) => _$AttItemFromJson(json);
  Map<String, dynamic> toJson() => _$AttItemToJson(this);
}