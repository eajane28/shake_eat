import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_data.freezed.dart';

part 'details_data.g.dart';

@freezed
class DetailsData with _$DetailsData {
  const factory DetailsData({
    required String image,
    // required String id,
  }) = _DetailsData;

  factory DetailsData.fromJson(Map<String, dynamic> json) =>
      _$DetailsDataFromJson(json);
}
