import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/app_translations.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/routes/app_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TrKeys.appName.tr,
      translations: AppTranslations(),
      // [VN] Mặc định tiếng Việt; fallback tiếng Anh
      locale: const Locale('vi', 'VN'),
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
