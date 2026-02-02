import 'package:go_router/go_router.dart';
import 'package:technical_test_pragma/presentation/screens/details/cats_detail.dart';
import 'package:technical_test_pragma/presentation/screens/home/home_screen.dart';
import 'package:technical_test_pragma/presentation/screens/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.name,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: "/home",
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: "/details/:id",
      name: CatsDetail.name,
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? 'no-id';
        return CatsDetail(id: id);
      },
    ),
  ],
);
