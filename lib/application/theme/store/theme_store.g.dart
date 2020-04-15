// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  Computed<bool> _$isDarkComputed;

  @override
  bool get isDark =>
      (_$isDarkComputed ??= Computed<bool>(() => super.isDark)).value;

  final _$themeAtom = Atom(name: '_ThemeStore.theme');

  @override
  ThemeData get theme {
    _$themeAtom.context.enforceReadPolicy(_$themeAtom);
    _$themeAtom.reportObserved();
    return super.theme;
  }

  @override
  set theme(ThemeData value) {
    _$themeAtom.context.conditionallyRunInAction(() {
      super.theme = value;
      _$themeAtom.reportChanged();
    }, _$themeAtom, name: '${_$themeAtom.name}_set');
  }

  final _$getThemeAsyncAction = AsyncAction('getTheme');

  @override
  Future<void> getTheme() {
    return _$getThemeAsyncAction.run(() => super.getTheme());
  }

  final _$toggleThemeAsyncAction = AsyncAction('toggleTheme');

  @override
  Future<void> toggleTheme() {
    return _$toggleThemeAsyncAction.run(() => super.toggleTheme());
  }

  @override
  String toString() {
    final string = 'theme: ${theme.toString()},isDark: ${isDark.toString()}';
    return '{$string}';
  }
}
