import 'package:provider/single_child_widget.dart';

abstract class Providers {
  static List<SingleChildWidget> getProviders() {
    final List<SingleChildWidget> providers = [
      // BlocProvider(
      //   create: (context) => HomeCubit(
      //     locator<HomeApiRepository>(),
      //   )..getMyCdts(),
      // ),
    ];
    return providers;
  }
}
