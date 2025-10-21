import 'package:dio_bloc_architecture_starter/core/navigation/routes_constants.dart';
import 'package:dio_bloc_architecture_starter/features/todo/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final routes = GoRouter(
    initialLocation: RoutesConstants.home,
    routes: [
      GoRoute(
        path: RoutesConstants.home,
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}
