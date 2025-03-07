import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

/// GlobalKey to access DetailsScreenState
final GlobalKey<DetailsScreenState> detailsScreenKey =
    GlobalKey<DetailsScreenState>();

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return DetailsScreen(key: detailsScreenKey);
          },
        ),
        GoRoute(
          path: 'second',
          builder: (BuildContext context, GoRouterState state) {
            return const SecondScreen();
          },
        ),
        GoRoute(
          path: 'third',
          builder: (BuildContext context, GoRouterState state) {
            return const ThirdScreen();
          },
        ),
      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

/// The home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/details'),
          child: const Text('Go to the Details Screen'),
        ),
      ),
    );
  }
}

/// The details screen
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

/// State class for DetailsScreen
class DetailsScreenState extends State<DetailsScreen> {
  void myFunction() {
    debugPrint("Function called when returning from ThirdScreen!");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Returned from Third Screen!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/second'),
          child: const Text('Go to the Second Screen'),
        ),
      ),
    );
  }
}

/// The second screen
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/third'),
          child: const Text('Go to the Third Screen'),
        ),
      ),
    );
  }
}

/// The third screen
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            while (GoRouter.of(context).canPop()) {
              context.pop();
            }
            // Call the function in DetailsScreen using GlobalKey
            detailsScreenKey.currentState?.myFunction();
          },
          child: const Text('Go Back to Details'),
        ),
      ),
    );
  }
}
