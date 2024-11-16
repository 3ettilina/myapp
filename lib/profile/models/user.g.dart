// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image'] as String,
      highlight: json['highlight'] as String? ?? '',
      fans: (json['fans'] as num?)?.toInt() ?? 0,
      follows: (json['follows'] as num?)?.toInt() ?? 0,
      reviews: (json['reviews'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'highlight': instance.highlight,
      'image': instance.imageUrl,
      'fans': instance.fans,
      'follows': instance.follows,
      'reviews': instance.reviews,
    };
