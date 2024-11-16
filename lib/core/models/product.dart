import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  final String id;
  final String title;
  final String description;

  @JsonKey(name: 'image')
  final String imageUrl;

  @override
  List<Object?> get props => [id, title, description, imageUrl];
}
