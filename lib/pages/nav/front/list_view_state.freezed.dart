// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListViewState _$ListViewStateFromJson(Map<String, dynamic> json) {
  return _ListViewState.fromJson(json);
}

/// @nodoc
mixin _$ListViewState {
  LoadStatus get status => throw _privateConstructorUsedError;
  int get curPage => throw _privateConstructorUsedError;
  int get maxPage => throw _privateConstructorUsedError;
  bool get floatingAppBar => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListViewStateCopyWith<ListViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListViewStateCopyWith<$Res> {
  factory $ListViewStateCopyWith(
          ListViewState value, $Res Function(ListViewState) then) =
      _$ListViewStateCopyWithImpl<$Res>;
  $Res call(
      {LoadStatus status,
      int curPage,
      int maxPage,
      bool floatingAppBar,
      String? errorMessage});
}

/// @nodoc
class _$ListViewStateCopyWithImpl<$Res>
    implements $ListViewStateCopyWith<$Res> {
  _$ListViewStateCopyWithImpl(this._value, this._then);

  final ListViewState _value;
  // ignore: unused_field
  final $Res Function(ListViewState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? curPage = freezed,
    Object? maxPage = freezed,
    Object? floatingAppBar = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      curPage: curPage == freezed
          ? _value.curPage
          : curPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      floatingAppBar: floatingAppBar == freezed
          ? _value.floatingAppBar
          : floatingAppBar // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ListViewStateCopyWith<$Res>
    implements $ListViewStateCopyWith<$Res> {
  factory _$$_ListViewStateCopyWith(
          _$_ListViewState value, $Res Function(_$_ListViewState) then) =
      __$$_ListViewStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {LoadStatus status,
      int curPage,
      int maxPage,
      bool floatingAppBar,
      String? errorMessage});
}

/// @nodoc
class __$$_ListViewStateCopyWithImpl<$Res>
    extends _$ListViewStateCopyWithImpl<$Res>
    implements _$$_ListViewStateCopyWith<$Res> {
  __$$_ListViewStateCopyWithImpl(
      _$_ListViewState _value, $Res Function(_$_ListViewState) _then)
      : super(_value, (v) => _then(v as _$_ListViewState));

  @override
  _$_ListViewState get _value => super._value as _$_ListViewState;

  @override
  $Res call({
    Object? status = freezed,
    Object? curPage = freezed,
    Object? maxPage = freezed,
    Object? floatingAppBar = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ListViewState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      curPage: curPage == freezed
          ? _value.curPage
          : curPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: maxPage == freezed
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      floatingAppBar: floatingAppBar == freezed
          ? _value.floatingAppBar
          : floatingAppBar // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ListViewState extends _ListViewState {
  const _$_ListViewState(
      {this.status = LoadStatus.none,
      this.curPage = 1,
      this.maxPage = 1,
      this.floatingAppBar = true,
      this.errorMessage})
      : super._();

  factory _$_ListViewState.fromJson(Map<String, dynamic> json) =>
      _$$_ListViewStateFromJson(json);

  @override
  @JsonKey()
  final LoadStatus status;
  @override
  @JsonKey()
  final int curPage;
  @override
  @JsonKey()
  final int maxPage;
  @override
  @JsonKey()
  final bool floatingAppBar;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ListViewState(status: $status, curPage: $curPage, maxPage: $maxPage, floatingAppBar: $floatingAppBar, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListViewState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.curPage, curPage) &&
            const DeepCollectionEquality().equals(other.maxPage, maxPage) &&
            const DeepCollectionEquality()
                .equals(other.floatingAppBar, floatingAppBar) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(curPage),
      const DeepCollectionEquality().hash(maxPage),
      const DeepCollectionEquality().hash(floatingAppBar),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_ListViewStateCopyWith<_$_ListViewState> get copyWith =>
      __$$_ListViewStateCopyWithImpl<_$_ListViewState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListViewStateToJson(
      this,
    );
  }
}

abstract class _ListViewState extends ListViewState {
  const factory _ListViewState(
      {final LoadStatus status,
      final int curPage,
      final int maxPage,
      final bool floatingAppBar,
      final String? errorMessage}) = _$_ListViewState;
  const _ListViewState._() : super._();

  factory _ListViewState.fromJson(Map<String, dynamic> json) =
      _$_ListViewState.fromJson;

  @override
  LoadStatus get status;
  @override
  int get curPage;
  @override
  int get maxPage;
  @override
  bool get floatingAppBar;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ListViewStateCopyWith<_$_ListViewState> get copyWith =>
      throw _privateConstructorUsedError;
}