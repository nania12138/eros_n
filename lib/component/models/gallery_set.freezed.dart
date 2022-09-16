// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GallerySet _$GallerySetFromJson(Map<String, dynamic> json) {
  return _GallerySet.fromJson(json);
}

/// @nodoc
mixin _$GallerySet {
  List<Gallery>? get gallerys => throw _privateConstructorUsedError;
  List<Gallery>? get populars => throw _privateConstructorUsedError;
  int? get maxPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GallerySetCopyWith<GallerySet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GallerySetCopyWith<$Res> {
  factory $GallerySetCopyWith(
          GallerySet value, $Res Function(GallerySet) then) =
      _$GallerySetCopyWithImpl<$Res>;
  $Res call({List<Gallery>? gallerys, List<Gallery>? populars, int? maxPage});
}

/// @nodoc
class _$GallerySetCopyWithImpl<$Res> implements $GallerySetCopyWith<$Res> {
  _$GallerySetCopyWithImpl(this._value, this._then);

  final GallerySet _value;
  // ignore: unused_field
  final $Res Function(GallerySet) _then;

  @override
  $Res call({
    Object? gallerys = freezed,
    Object? populars = freezed,
    Object? maxPage = freezed,
  }) {
    return _then(_value.copyWith(
      gallerys: gallerys == freezed
          ? _value.gallerys
          : gallerys // ignore: cast_nullable_to_non_nullable
              as List<Gallery>?,
      populars: populars == freezed
          ? _value.populars
          : populars // ignore: cast_nullable_to_non_nullable
              as List<Gallery>?,
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_GallerySetCopyWith<$Res>
    implements $GallerySetCopyWith<$Res> {
  factory _$$_GallerySetCopyWith(
          _$_GallerySet value, $Res Function(_$_GallerySet) then) =
      __$$_GallerySetCopyWithImpl<$Res>;
  @override
  $Res call({List<Gallery>? gallerys, List<Gallery>? populars, int? maxPage});
}

/// @nodoc
class __$$_GallerySetCopyWithImpl<$Res> extends _$GallerySetCopyWithImpl<$Res>
    implements _$$_GallerySetCopyWith<$Res> {
  __$$_GallerySetCopyWithImpl(
      _$_GallerySet _value, $Res Function(_$_GallerySet) _then)
      : super(_value, (v) => _then(v as _$_GallerySet));

  @override
  _$_GallerySet get _value => super._value as _$_GallerySet;

  @override
  $Res call({
    Object? gallerys = freezed,
    Object? populars = freezed,
    Object? maxPage = freezed,
  }) {
    return _then(_$_GallerySet(
      gallerys: gallerys == freezed
          ? _value._gallerys
          : gallerys // ignore: cast_nullable_to_non_nullable
              as List<Gallery>?,
      populars: populars == freezed
          ? _value._populars
          : populars // ignore: cast_nullable_to_non_nullable
              as List<Gallery>?,
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GallerySet implements _GallerySet {
  const _$_GallerySet(
      {final List<Gallery>? gallerys,
      final List<Gallery>? populars,
      this.maxPage})
      : _gallerys = gallerys,
        _populars = populars;

  factory _$_GallerySet.fromJson(Map<String, dynamic> json) =>
      _$$_GallerySetFromJson(json);

  final List<Gallery>? _gallerys;
  @override
  List<Gallery>? get gallerys {
    final value = _gallerys;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Gallery>? _populars;
  @override
  List<Gallery>? get populars {
    final value = _populars;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? maxPage;

  @override
  String toString() {
    return 'GallerySet(gallerys: $gallerys, populars: $populars, maxPage: $maxPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GallerySet &&
            const DeepCollectionEquality().equals(other._gallerys, _gallerys) &&
            const DeepCollectionEquality().equals(other._populars, _populars) &&
            const DeepCollectionEquality().equals(other.maxPage, maxPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_gallerys),
      const DeepCollectionEquality().hash(_populars),
      const DeepCollectionEquality().hash(maxPage));

  @JsonKey(ignore: true)
  @override
  _$$_GallerySetCopyWith<_$_GallerySet> get copyWith =>
      __$$_GallerySetCopyWithImpl<_$_GallerySet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GallerySetToJson(
      this,
    );
  }
}

abstract class _GallerySet implements GallerySet {
  const factory _GallerySet(
      {final List<Gallery>? gallerys,
      final List<Gallery>? populars,
      final int? maxPage}) = _$_GallerySet;

  factory _GallerySet.fromJson(Map<String, dynamic> json) =
      _$_GallerySet.fromJson;

  @override
  List<Gallery>? get gallerys;
  @override
  List<Gallery>? get populars;
  @override
  int? get maxPage;
  @override
  @JsonKey(ignore: true)
  _$$_GallerySetCopyWith<_$_GallerySet> get copyWith =>
      throw _privateConstructorUsedError;
}