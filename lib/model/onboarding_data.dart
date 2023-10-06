import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_data.freezed.dart';

part 'onboarding_data.g.dart';

@freezed
class OnboardingData with _$OnboardingData {
  const factory OnboardingData({
    required String imagePage,
    required String title,
    required String message,
  }) = _OnboardingData;

  factory OnboardingData.fromJson(Map<String, dynamic> json) =>
      _$OnboardingDataFromJson(json);
}