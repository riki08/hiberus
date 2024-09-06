import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiberus/config/router/app_router.dart';
import 'package:hiberus/utils/constants/strings.dart';
import 'package:hiberus/utils/locator.dart';
import 'package:hiberus/utils/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Providers.getProviders(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        title: appTitle,
      ),
    );
  }
}
