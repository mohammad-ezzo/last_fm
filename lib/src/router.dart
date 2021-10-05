import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/features/search/pages/search_page.dart';
import 'package:last_fm/src/features/splash/pages/splash_page.dart';
import 'package:last_fm/src/features/track%20view/pages/track_view_page.dart';

class AppRouter {
  static String currentRoute = "/";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => SplashPage());
      case '/search':
        return CupertinoPageRoute(builder: (_) => SearchPage());
      case '/trackView':
        final track = settings.arguments as Track;
        return CupertinoPageRoute(
            builder: (_) => TrackViewpage(
                  track: track,
                ));

      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
