import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_theme/application/theme/services/theme_service.dart';
import 'package:mobx_theme/application/theme/store/theme_store.dart';
import 'package:mobx_theme/infrastructure/theme/datasources/theme_repository.dart';
import 'package:mobx_theme/presentation/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(
            create: (_) =>
                ThemeStore(ThemeService(ThemeRepository()))..getTheme())
      ],
      child: Consumer<ThemeStore>(
        builder: (_, ThemeStore value, __) => Observer(
          builder: (_) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MobX Theme Switcher',
            theme: value.theme,
            home: SplashPage(),
          ),
        ),
      ),
    );
  }
}
