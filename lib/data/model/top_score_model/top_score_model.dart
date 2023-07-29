import 'package:collection/collection.dart';

import 'result.dart';

class TopScorerModel {
  int? success;
  List<Result>? result;

  TopScorerModel({this.success, this.result});

  factory TopScorerModel.fromJson(Map<String, dynamic> json) => TopScorerModel(
        success: json['success'] as int?,
        result: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TopScorerModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ result.hashCode;
}
