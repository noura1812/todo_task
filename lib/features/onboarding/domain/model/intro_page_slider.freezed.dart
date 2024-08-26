// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_page_slider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IntroPageSlider {
  String get image => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  bool get isLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroPageSliderCopyWith<IntroPageSlider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroPageSliderCopyWith<$Res> {
  factory $IntroPageSliderCopyWith(
          IntroPageSlider value, $Res Function(IntroPageSlider) then) =
      _$IntroPageSliderCopyWithImpl<$Res, IntroPageSlider>;
  @useResult
  $Res call({String image, String? title, String? desc, bool isLanguage});
}

/// @nodoc
class _$IntroPageSliderCopyWithImpl<$Res, $Val extends IntroPageSlider>
    implements $IntroPageSliderCopyWith<$Res> {
  _$IntroPageSliderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? title = freezed,
    Object? desc = freezed,
    Object? isLanguage = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      isLanguage: null == isLanguage
          ? _value.isLanguage
          : isLanguage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntroPageSliderImplCopyWith<$Res>
    implements $IntroPageSliderCopyWith<$Res> {
  factory _$$IntroPageSliderImplCopyWith(_$IntroPageSliderImpl value,
          $Res Function(_$IntroPageSliderImpl) then) =
      __$$IntroPageSliderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image, String? title, String? desc, bool isLanguage});
}

/// @nodoc
class __$$IntroPageSliderImplCopyWithImpl<$Res>
    extends _$IntroPageSliderCopyWithImpl<$Res, _$IntroPageSliderImpl>
    implements _$$IntroPageSliderImplCopyWith<$Res> {
  __$$IntroPageSliderImplCopyWithImpl(
      _$IntroPageSliderImpl _value, $Res Function(_$IntroPageSliderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? title = freezed,
    Object? desc = freezed,
    Object? isLanguage = null,
  }) {
    return _then(_$IntroPageSliderImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      isLanguage: null == isLanguage
          ? _value.isLanguage
          : isLanguage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IntroPageSliderImpl implements _IntroPageSlider {
  const _$IntroPageSliderImpl(
      {required this.image,
      required this.title,
      required this.desc,
      this.isLanguage = false});

  @override
  final String image;
  @override
  final String? title;
  @override
  final String? desc;
  @override
  @JsonKey()
  final bool isLanguage;

  @override
  String toString() {
    return 'IntroPageSlider(image: $image, title: $title, desc: $desc, isLanguage: $isLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntroPageSliderImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.isLanguage, isLanguage) ||
                other.isLanguage == isLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, title, desc, isLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroPageSliderImplCopyWith<_$IntroPageSliderImpl> get copyWith =>
      __$$IntroPageSliderImplCopyWithImpl<_$IntroPageSliderImpl>(
          this, _$identity);
}

abstract class _IntroPageSlider implements IntroPageSlider {
  const factory _IntroPageSlider(
      {required final String image,
      required final String? title,
      required final String? desc,
      final bool isLanguage}) = _$IntroPageSliderImpl;

  @override
  String get image;
  @override
  String? get title;
  @override
  String? get desc;
  @override
  bool get isLanguage;
  @override
  @JsonKey(ignore: true)
  _$$IntroPageSliderImplCopyWith<_$IntroPageSliderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
