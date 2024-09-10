import 'package:bloc_test/bloc_test.dart';
import 'package:hiberus/cards/presentation/cubit/card_cubit.dart';
import 'package:hiberus/models/card_list_model.dart';
import 'package:hiberus/utils/resources/data_state.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks/mock_cards_repository.mocks.dart';

void main() {
  late MockCardApiRepository mockApiRepository;
  late CardCubit cardCubit;

  setUp(() {
    mockApiRepository = MockCardApiRepository();
    cardCubit = CardCubit(mockApiRepository);
  });

  blocTest<CardCubit, CardState>(
    'emits [CardLoading, CardSuccess] when getAllCards is successful',
    build: () {
      when(mockApiRepository.getAllCards())
          .thenAnswer((_) async => DataSuccess<CardsModel>(CardsModel(cards: [Card1(name: "hols")])));

      return cardCubit;
    },
    act: (cubit) => cubit.getAllCards(),
    expect: () => [
      const CardLoading(),
      isA<CardSuccess>().having((state) => state.cardsModel!.cards!.length, 'cards length', 1),
    ],
  );
}
