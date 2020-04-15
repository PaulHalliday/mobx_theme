import 'package:flutter/material.dart';

abstract class IThemeRepository {
  Future<String> getThemeKey();
  Future<void> setThemeKey(Brightness brightness);
}
