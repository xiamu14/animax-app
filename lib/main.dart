import 'package:animax/screens/home.dart';
import 'package:animax/screens/tab_box.dart';
import 'package:animax/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(AppWithRoutes());
}

class AppWithRoutes extends StatelessWidget {
  AppWithRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'Animax Demo',
        theme: ThemeData(
          primaryColor: Color(0xff06C149),
        ),
      );

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: Welcome.routePath,
        builder: ((context, state) => const Welcome()),
      ),
      GoRoute(
        path: '/:screen(tabHome|TabProfile)',
        builder: ((BuildContext context, GoRouterState state) {
          final String screen = state.params['screen']!;
          print(screen);
          return TabBox(
            screen: screen,
          );
        }),
      )
    ],
    initialLocation: Home.routePath,
  );
}
