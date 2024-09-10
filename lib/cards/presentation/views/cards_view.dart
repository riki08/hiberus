import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:hiberus/cards/presentation/cubit/card_cubit.dart';
import 'package:hiberus/models/card_list_model.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  void initState() {
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
                        return Hero(
                          tag: card.id!,
                          child: GestureDetector(
                            onTap: () {
                              context.push("/cards/${card.id!}");
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 200,
                              child: CachedNetworkImage(
                                key: Key(card.id!),
                                imageUrl: card.imageUrl!,
                                cacheManager: CacheManager(Config(
                                  card.id!,
                                  stalePeriod: const Duration(days: 1),
                                  //one week cache period
                                )),
                                fit: BoxFit.contain,
                                cacheKey: card.id,
                                progressIndicatorBuilder: (context, url, downloadProgress) => Transform.scale(
                                  scale: 0.5,
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
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
                                ),
                              ),
                            ),
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
