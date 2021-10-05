import 'package:flutter/material.dart';
import 'package:last_fm/src/features/splash/pages/splash_page.dart';
import 'package:last_fm/src/style.dart';

import '../../../router.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Last Fm',
      theme: ThemeData(primaryColor: AppColors.primaryColor),
      onGenerateRoute: AppRouter.generateRoute,
      restorationScopeId: "app",
      initialRoute: "/",
      home: const SplashPage(),
    );
  }
}
