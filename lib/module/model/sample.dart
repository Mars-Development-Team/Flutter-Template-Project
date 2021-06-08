import 'package:mars_rover/networking/model/network_model.dart';

import 'package:json_annotation/json_annotation.dart';
part 'sample.g.dart';

@JsonSerializable()
class Sample extends INetworkModel<Sample> {
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'completed')
  bool? completed;

  Sample({
    this.id,
    this.completed,
    this.title,
    this.userId,
  });
  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SampleToJson(this);

  @override
  Sample fromJson(Map<String, Object> json) {
    return Sample.fromJson(json);
  }
}
