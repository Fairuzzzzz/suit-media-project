import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:suit_media_project/core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        title: "suit_media_project",
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.palindromePage,
        getPages: Routes.list,
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(0.85)),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: widget!,
            ),
          );
        },
      ),
    );
  }
}
