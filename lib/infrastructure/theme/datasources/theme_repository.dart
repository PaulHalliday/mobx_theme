/// lib/infrastructure/theme/datasources/theme_repository.dart
import 'dart:ui';

import 'package:mobx_theme/domain/theme/constants/theme_keys.dart';
import 'package:mobx_theme/domain/theme/interfaces/i_theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository implements IThemeRepository {
  @override
  Future<void> setThemeKey(Brightness brightness) async {
    (await SharedPreferences.getInstance()).setString(
      ThemeKey.THEME,
      brightness == Brightness.light ? "light" : "dark",
    );
  }

  @override
  Future<String> getThemeKey() async {
    return (await SharedPreferences.getInstance()).getString(ThemeKey.THEME);
  }
}
