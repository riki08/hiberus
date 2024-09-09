import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiberus/cards/presentation/cubit/card_cubit.dart';
import 'package:hiberus/models/card_list_model.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  late CardCubit cardCubit;

  @override
  void initState() {
    cardCubit = BlocProvider.of<CardCubit>(context);
    cardCubit.getAllCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cards"),
        ),
        body: BlocBuilder<CardCubit, CardState>(
          builder: (_, state) {
            switch (state.runtimeType) {
              case CardLoading:
                return const Center(child: CircularProgressIndicator());
              case CardSuccess:
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        final Card1 card = state.cardsModel!.cards![index];
                        return Container(
                          margin: const EdgeInsets.all(5),
                          child: Image.network(
                            card.imageUrl!,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    card.name!,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      itemCount: state.cardsModel!.cards!.length),
                );
              default:
                return const SizedBox();
            }
          },
        ));
  }
}
