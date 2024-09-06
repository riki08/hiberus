part of 'card_cubit.dart';

abstract class CardState extends Equatable {
  final DioException? error;
  final CardsModel? cardsModel;

  const CardState({this.error, this.cardsModel});

  @override
  List<Object?> get props => [error, cardsModel];
}

class CardInitial extends CardState {
  const CardInitial();
}

class CardLoading extends CardState {
  const CardLoading();
}

class CardSuccess extends CardState {
  final CardsModel? cardsModel;
  const CardSuccess(this.cardsModel);
}

class CardFailed extends CardState {
  const CardFailed({error});
}
