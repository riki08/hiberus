import 'package:go_router/go_router.dart';
import 'package:hiberus/cars/presentation/views/cards_view.dart';
import 'package:hiberus/details_card/presentation/views/details_card.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'CardsView',
      builder: (context, state) => const CardsView(),
    ),
    GoRoute(
      path: '/cards/:id',
      name: 'DetailsCard',
      builder: (context, state) => DetailsCard(id: state.pathParameters['id']),
    ),
  ],
);
