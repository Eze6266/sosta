import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sosta/routes/router.dart';

import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  await ScreenUtil.ensureScreenSize();
  runApp(ScreenUtilInit(
    builder: ((context, child) {
      return MyApp();
    }),
    designSize: const Size(360, 690),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'SostaApp';
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: const Size(360, 690));
    return MaterialApp.router(
      routerConfig: CustomRouter.router,
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Airbnb',
      ),
    );
  }
}
