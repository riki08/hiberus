part of 'detail_card_cubit.dart';

abstract class DetailCardState extends Equatable {
  final DioException? error;
  final DetailCarResponse? card;

  const DetailCardState({this.error, this.card});

  @override
  List<Object?> get props => [error, card];
}

class DetailCardInitial extends DetailCardState {
  const DetailCardInitial();
}

class DetailCardLoading extends DetailCardState {
  const DetailCardLoading();
}

class DetailCardSuccess extends DetailCardState {
  @override
  final DetailCarResponse? card;
  const DetailCardSuccess(this.card);
}

class DetailCardFailed extends DetailCardState {
  const DetailCardFailed({error});
}
