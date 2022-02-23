import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_dashboard/constants/style.dart';
import 'package:web_dashboard/controllers/menu_controller.dart';
import 'package:web_dashboard/controllers/navigation_controller.dart';
import 'package:web_dashboard/layout.dart';
import 'package:web_dashboard/pages/404/page_not_found.dart';
import 'package:web_dashboard/pages/authentication/authentication.dart';
import 'package:web_dashboard/routing/routes.dart';

void main(List<String> args) {
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(
    const AppWidget(),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: authenticationPageRoute,
      unknownRoute: GetPage(
        name: "/notFound",
        page: () => const PageNotFound(),
        transition: Transition.fadeIn,
      ),
      getPages: [
        GetPage(
            name: rootRoute,
            page: () {
              return SiteLayout();
            }),
        GetPage(
          name: authenticationPageRoute,
          page: () => const AuthenticationPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: "DashBoard",
      theme: ThemeData(
        scaffoldBackgroundColor: lightColor,
        textTheme:
            GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        primaryColor: Colors.blue,
      ),
    );
  }
}
