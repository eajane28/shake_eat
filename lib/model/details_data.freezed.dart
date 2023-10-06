// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailsData _$DetailsDataFromJson(Map<String, dynamic> json) {
  return _DetailsData.fromJson(json);
}

/// @nodoc
mixin _$DetailsData {
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsDataCopyWith<DetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsDataCopyWith<$Res> {
  factory $DetailsDataCopyWith(
          DetailsData value, $Res Function(DetailsData) then) =
      _$DetailsDataCopyWithImpl<$Res, DetailsData>;
  @useResult
  $Res call({String image});
}

/// @nodoc
class _$DetailsDataCopyWithImpl<$Res, $Val extends DetailsData>
    implements $DetailsDataCopyWith<$Res> {
  _$DetailsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsDataCopyWith<$Res>
    implements $DetailsDataCopyWith<$Res> {
  factory _$$_DetailsDataCopyWith(
          _$_DetailsData value, $Res Function(_$_DetailsData) then) =
      __$$_DetailsDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image});
}

/// @nodoc
class __$$_DetailsDataCopyWithImpl<$Res>
    extends _$DetailsDataCopyWithImpl<$Res, _$_DetailsData>
    implements _$$_DetailsDataCopyWith<$Res> {
  __$$_DetailsDataCopyWithImpl(
      _$_DetailsData _value, $Res Function(_$_DetailsData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_DetailsData(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailsData implements _DetailsData {
  const _$_DetailsData({required this.image});

  factory _$_DetailsData.fromJson(Map<String, dynamic> json) =>
      _$$_DetailsDataFromJson(json);

  @override
  final String image;

  @override
  String toString() {
    return 'DetailsData(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsData &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsDataCopyWith<_$_DetailsData> get copyWith =>
      __$$_DetailsDataCopyWithImpl<_$_DetailsData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailsDataToJson(
      this,
    );
  }
}

abstract class _DetailsData implements DetailsData {
  const factory _DetailsData({required final String image}) = _$_DetailsData;

  factory _DetailsData.fromJson(Map<String, dynamic> json) =
      _$_DetailsData.fromJson;

  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsDataCopyWith<_$_DetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}
