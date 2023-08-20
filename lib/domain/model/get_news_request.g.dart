// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_news_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNewsRequest _$GetNewsRequestFromJson(Map<String, dynamic> json) =>
    GetNewsRequest(
      apiKey: json['apiKey'] as String? ?? '',
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$GetNewsRequestToJson(GetNewsRequest instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'category': instance.category,
    };
