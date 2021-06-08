// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sample _$SampleFromJson(Map<String, dynamic> json) {
  return Sample(
    id: json['id'] as int?,
    completed: json['completed'] as bool?,
    title: json['title'] as String?,
    userId: json['userId'] as int?,
  );
}

Map<String, dynamic> _$SampleToJson(Sample instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
