import 'package:assistant_task/cubits/product_cubit.dart';
import 'package:assistant_task/data/models/state/my_state.dart';
import 'package:assistant_task/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostProduct extends StatefulWidget {
  const PostProduct({Key? key}) : super(key: key);

  @override
  State<PostProduct> createState() => _PostProductState();
}

class _PostProductState extends State<PostProduct> {
  final nameC = TextEditingController();
  final idC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Product")),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (BuildContext context, state) {
          var st = state.myState;
          if (st == MyState.SUCCESS) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameC,
                    decoration: const InputDecoration(hintText: "Name", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: idC,
                    decoration: const InputDecoration(hintText: "ID", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 50),
                  TextButton(
                    onPressed: () async {
                      try {
                        context.read<ProductCubit>().addProduct(productName: nameC.text, productId: int.parse(idC.text));
                        Navigator.pop(context);
                      } catch (e) {
                        UtilityFunctions.getMyToast(message: e.toString());
                      }
                    },
                    child: const Text(
                      "Post product",
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  void dispose() {
    nameC.dispose();
    idC.dispose();
    super.dispose();
  }
}
