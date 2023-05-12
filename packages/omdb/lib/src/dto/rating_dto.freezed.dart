// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatingDto _$RatingDtoFromJson(Map<String, dynamic> json) {
  return _RatingDto.fromJson(json);
}

/// @nodoc
mixin _$RatingDto {
  @JsonKey(name: 'Source')
  String get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'Value')
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingDtoCopyWith<RatingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingDtoCopyWith<$Res> {
  factory $RatingDtoCopyWith(RatingDto value, $Res Function(RatingDto) then) =
      _$RatingDtoCopyWithImpl<$Res, RatingDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Source') String source,
      @JsonKey(name: 'Value') String value});
}

/// @nodoc
class _$RatingDtoCopyWithImpl<$Res, $Val extends RatingDto>
    implements $RatingDtoCopyWith<$Res> {
  _$RatingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingDtoCopyWith<$Res> implements $RatingDtoCopyWith<$Res> {
  factory _$$_RatingDtoCopyWith(
          _$_RatingDto value, $Res Function(_$_RatingDto) then) =
      __$$_RatingDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Source') String source,
      @JsonKey(name: 'Value') String value});
}

/// @nodoc
class __$$_RatingDtoCopyWithImpl<$Res>
    extends _$RatingDtoCopyWithImpl<$Res, _$_RatingDto>
    implements _$$_RatingDtoCopyWith<$Res> {
  __$$_RatingDtoCopyWithImpl(
      _$_RatingDto _value, $Res Function(_$_RatingDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? value = null,
  }) {
    return _then(_$_RatingDto(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatingDto extends _RatingDto {
  const _$_RatingDto(
      {@JsonKey(name: 'Source') this.source = 'N/A',
      @JsonKey(name: 'Value') this.value = '0'})
      : super._();

  factory _$_RatingDto.fromJson(Map<String, dynamic> json) =>
      _$$_RatingDtoFromJson(json);

  @override
  @JsonKey(name: 'Source')
  final String source;
  @override
  @JsonKey(name: 'Value')
  final String value;

  @override
  String toString() {
    return 'RatingDto(source: $source, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingDto &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, source, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingDtoCopyWith<_$_RatingDto> get copyWith =>
      __$$_RatingDtoCopyWithImpl<_$_RatingDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingDtoToJson(
      this,
    );
  }
}

abstract class _RatingDto extends RatingDto {
  const factory _RatingDto(
      {@JsonKey(name: 'Source') final String source,
      @JsonKey(name: 'Value') final String value}) = _$_RatingDto;
  const _RatingDto._() : super._();

  factory _RatingDto.fromJson(Map<String, dynamic> json) =
      _$_RatingDto.fromJson;

  @override
  @JsonKey(name: 'Source')
  String get source;
  @override
  @JsonKey(name: 'Value')
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_RatingDtoCopyWith<_$_RatingDto> get copyWith =>
      throw _privateConstructorUsedError;
}
