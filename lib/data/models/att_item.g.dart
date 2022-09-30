// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'att_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttItem _$AttItemFromJson(Map<String, dynamic> json) => AttItem(
      name: json['name'] as String? ?? '',
      productId: json['product_id'] as int? ?? 0,
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$AttItemToJson(AttItem instance) => <String, dynamic>{
      'name': instance.name,
      'product_id': instance.productId,
      'createdAt': instance.createdAt,
    };
