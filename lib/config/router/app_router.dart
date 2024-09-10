import 'package:go_router/go_router.dart';
import 'package:hiberus/cards/presentation/views/cards_view.dart';
import 'package:hiberus/detail_card/presentation/views/details_card.dart';
import 'package:hiberus/form/presentation/views/form.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'RegisterView',
      builder: (context, state) => const FormView(),
    ),
    GoRoute(
      path: '/cards',
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
