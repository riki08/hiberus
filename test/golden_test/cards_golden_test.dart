import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hiberus/cards/data/datasources/card_api_service.dart';
import 'package:hiberus/cards/presentation/cubit/card_cubit.dart';
import 'package:hiberus/cards/presentation/views/cards_view.dart';
import 'package:hiberus/models/card_list_model.dart';
import 'package:mockito/mockito.dart';

class MockCardCubit extends MockCubit<CardState> implements CardCubit {
  @override
  CardState get state => CardSuccess(CardsModel(cards: [
        Card1(
          id: "type-1",
          name: "test",
          imageUrl: "https://placehold.co/600x400",
        )
      ]));
}

class MockCardService extends Mock implements CardApiService {}

void main() {
  final getIt = GetIt.instance;
  late MockCardCubit mockCardCubit;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    mockCardCubit = MockCardCubit();
    getIt.registerSingleton<MockCardService>(MockCardService());
    getIt.registerSingleton<CardCubit>(mockCardCubit);
  });

  setUp(() {});

  tearDown(() {
    getIt.reset();
  });

  testWidgets('All Cards', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CardCubit>.value(
          value: mockCardCubit,
          child: const CardsView(),
        ),
      ),
    );

    expectLater(
      find.byType(CardsView),
      matchesGoldenFile(
        'images/cards.png',
      ),
    );
  });
}
