// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// // import 'package:mobile_app/screens/home/home_view.dart';
// // import 'package:mobile_app/screens/product/product_view.dart';
// import 'package:mobile_app/screens/scaffold_with_navbar.dart';
// // import 'package:mobile_app/screens/home/splash_view.dart';
// // import 'package:mobile_app/utitls/routers.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: _router,
//     );
//     // return GetMaterialApp(
//     //   title: 'Flutter Demo',
//     //   debugShowCheckedModeBanner: false,
//     //   theme: ThemeData(
//     //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//     //     useMaterial3: true,
//     //     scaffoldBackgroundColor: Colors.white,
//     //   ),
//     //   // home: const SplashView(),
//     //   initialRoute: Routers.welcome,
//     //   getPages: Routers.routers,
//     // );
//   }

//   static final _rootNavigatorKey = GlobalKey<NavigatorState>();
//   // static final _navigationShell = GlobalKey<NavigatorState>();

//   final GoRouter _router = GoRouter(
//     navigatorKey: _rootNavigatorKey,
//     initialLocation: '/',
//     routes: <RouteBase>[
//       StatefulShellRoute.indexedStack(
//         // navigatorKey: _navigationShell,
//         builder: (BuildContext context, GoRouterState state, navigationShell) {
//           return ScaffoldWithNavBar(navigationShell: navigationShell);
//         },
//         branches: <StatefulShellBranch>[
//           // navigatorKey:  _navigationShell,
//           StatefulShellBranch(
//             routes: <RouteBase>[
//               GoRoute(
//                 path: '/', // Corrected path
//                 builder: (BuildContext context, GoRouterState state) {
//                   return const ProductView();
//                 },
//               ),
//               GoRoute(
//                 path: '/details', // Corrected path
//                 builder: (BuildContext context, GoRouterState state) {
//                   return HomeView();
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   );
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/screens/home/home_view.dart';
import 'package:mobile_app/screens/home/splash_view.dart';
import 'package:mobile_app/screens/product/product_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: '/product',
        name: 'Product',
        builder: (BuildContext context, GoRouterState state) {
          return const ProductView();
        },
      ),
      GoRoute(
        path: '/home_view',
        builder: (BuildContext context, GoRouterState state) {
          return HomeView();
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/main',
                name: 'Main',
                builder: (BuildContext context, GoRouterState state) {
                  return const Product();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (BuildContext context, GoRouterState state) {
                  return const Home();
                },
                routes: [
                  GoRoute(
                    path: 'details',
                    name: 'Details',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: HomeView(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routerDelegate: _router.routerDelegate,
      // routeInformationParser: _router.routeInformationParser,
      routerConfig: _router,
    );
  }
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Details'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product View')),
      body: const Center(child: Text('Product View Content')),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home View')),
      body: Center(
          child: InkWell(
        child: Text('Home View'),
        onTap: () => context.go('/home/details'),
      )),
    );
  }
}
