import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_theme/application/theme/store/theme_store.dart';
import 'package:mobx_theme/core/constants/asset_keys.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ThemeStore themeStore;

  GlobalKey<ScaffoldState> _scaffoldKey;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    themeStore ??= Provider.of<ThemeStore>(context);
    _disposers ??= [
      reaction((fn) => themeStore.isDark, (isDark) {
        _scaffoldKey.currentState?.removeCurrentSnackBar();

        if (isDark) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Hello, Dark!"),
          ));
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Hello, Light!"),
          ));
        }
      })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: themeStore.toggleTheme,
        child: themeStore.isDark
            ? Icon(Icons.brightness_high)
            : Icon(Icons.brightness_2),
      ),
      body: buildSplash(context),
    );
  }

  Widget buildSplash(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: themeStore.isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (!kIsWeb)
              SvgPicture.asset(
                themeStore.isDark
                    ? AssetKeys.FOOD_DARK_SVG
                    : AssetKeys.FOOD_LIGHT_SVG,
                height: 200,
              ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Foodie",
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "The best way to track your nutrition.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    super.dispose();
  }
}
