import 'package:assistant_task/cubits/product_cubit.dart';
import 'package:assistant_task/data/repos/product_repo.dart';
import 'package:assistant_task/data/services/api_client.dart';
import 'package:assistant_task/data/services/api_provider.dart';
import 'package:assistant_task/ui/get_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductCubit(
            productsRepo: ProductsRepo(
              apiProvider: ApiProvider(
                apiClient: ApiClient(),
              ),
            ),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetProducts(),
    );
  }
}
